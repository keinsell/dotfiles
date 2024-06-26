PKG_GROUPS = base devel package_managers fonts
PKG_MANAGER = paru -S --noconfirm --needed
JSONNET_PACKAGE_MANIFEST = packages.jsonnet

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
