PKG_GROUPS = base devel package_managers fonts
PKG_MANAGER = paru -S --noconfirm --needed
JSONNET_PACKAGE_MANIFEST = packages.jsonnet
USERNAME=keinsell

ARGS := $(filter-out $@,$(MAKECMDGOALS))
V1 ?= 'zsh'

install:
	# TODO: Validate if nix is installed
	curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
 	nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
	nix-channel --update
	nix-shell '<home-manager>' -A install

install_hm:	
	nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
	nix-channel --update
	nix-shell '<home-manager>' -A install

.PHONY: link-all

# Link will create symlinks to dotfiles from repository
# Inspired by: https://venthur.de/2021-12-19-managing-dotfiles-with-stow.html
link:	
	stow --verbose --target=$$HOME --restow --dotfiles --adopt zsh
	stow --verbose --target=$$HOME/.config --restow --dotfiles --adopt helix zsh kitty

unlink:
	stow --verbose --target=$$HOME --dotfiles --adopt -D $(V1)

# Link and switch into home manager configuration
hm:
	stow -t $$HOME/.config --restow --dotfiles -D home-manager
	home-manager switch

install_zsh:
	sudo echo "$$HOME/.nix-profile/bin/zsh" > /etc/shells

# Will parse the JSONNET_PACKAGE_MANIFEST and output it to json file
parse_jsonnet:
	mkdir -p ./pkg_groups
	jsonnet -J vendor -m ./pkg_groups $(JSONNET_PACKAGE_MANIFEST)

preinstall:
	$(PKG_MANAGER) jq jsonnet paru

# Parse array from dist/base which is a JSON
# and install all packages defined in such array
# parsing is done by jq
install_devel: preinstall parse_jsonnet
	$(PKG_MANAGER) $(shell jq -r '.[]' ./pkg_groups/devel)

install_fonts: install_devel
	$(PKG_MANAGER) $(shell jq -r '.[]' ./pkg_groups/fonts)

install_de: install_devel
	$(PKG_MANAGER) $(shell jq -r '.[]' ./pkg_groups/desktop_environment)

install_shell: install_devel
	$(PKG_MANAGER) $(shell jq -r '.[]' ./pkg_groups/shell)

install_software: install_devel
	$(PKG_MANAGER) $(shell jq -r '.[]' ./pkg_groups/software)

install_security: install_devel
	$(PKG_MANAGER) $(shell jq -r '.[]' ./pkg_groups/security)

install_all: install_de install_fonts install_shell install_software install_security

.PHONY: $(ARGS)
