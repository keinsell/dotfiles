{ config, lib, pkgs, ... }:

# https://home-manager-options.extranix.com
# https://noogle.dev/
# https://search.nixos.org/packages

# with import <nixpkgs> {};
with builtins;
with lib;
with import <home-manager/modules/lib/dag.nix> { inherit lib; };
# nix profile install github:guibou/nixGL --impure
let
  # nix profile install github:guibou/nixGL
  nixgl = pkgs.callPackage (pkgs.fetchFromGitHub {
      owner = "guibou";
      repo = "nixGL";
      rev = "master";
      sha256 = "sha256-lnzZQYG0+EXl/6NkGpyIz+FEOc/DSEG57AP1VsdeNrM=";
    }) {inherit pkgs;};
#    nixglhost-sources = pkgs.fetchFromGitHub {
#      owner = "numtide";
#      repo = "nix-gl-host";
#      rev = "main";
#      # Replace this with the hash Nix will complain about, TOFU style.
#      hash = "sha256-e3EAKVsrmuC4NwEEpAU6nS4LgNoGH/7fgax1eUtxz18=";
#    };
#nixglhost = pkgs.callPackage "${nixglhost-sources}/default.nix" {};
nixGLwrap = pkg: config.lib.nixGL.wrap pkg;
in
{
  targets.genericLinux.enable = true;

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
    # overlays = [ nixgl.overlay ];
  };

  # home.activation = {
  #   clearNixglCacle = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
  #     [ -v DRY_RUN ] || rm -f ${config.xdg.cacheHome}/nixgl/result*
  #   '';
  # };

  home.username = "keinsell";
  home.homeDirectory = "/home/${config.home.username}";
  home.stateVersion = "24.05";

  home.packages = [
    pkgs.redisinsight
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" "FantasqueSansMono" "GeistMono" ]; })
    pkgs.fzf
    pkgs.ripgrep
    pkgs.fd
    pkgs.bat
    pkgs.neofetch
    (nixGLwrap pkgs.kitty)
    # Media Gallery
    pkgs.lux
    pkgs.gallery-dl
    pkgs.vdhcoapp
    pkgs.parabolic
    pkgs.yt-dlp
    (nixGLwrap pkgs.glxinfo)
    # Docker
    pkgs.docker
    pkgs.docker-buildx
    pkgs.docker-compose
    # Kubernetes
    pkgs.kubectl
    pkgs.kubernetes-helm
    # Jetbrains IDEs
    pkgs.jetbrains-toolbox
    pkgs.android-studio
    # Lightweight IDEs
    pkgs.zed-editor
    # Software
    pkgs.tor-browser
    pkgs.mailspring

    # Certificates
    pkgs.openssl
    pkgs.mkcert

    # Add nixGL to home.packages
    (pkgs.fetchFromGitHub {
      owner = "guibou";
      repo = "nixGL";
      rev = "master";
      sha256 = "sha256-lnzZQYG0+EXl/6NkGpyIz+FEOc/DSEG57AP1VsdeNrM=";
    })
#    nixglhost
  ];

  home.file = {
    "~/.config/zed/config.json".source = ./programs/zed/config.json;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Shell Configuration
  programs.yazi.enable = true;
  programs.thefuck.enable = true;
  programs.eza.enable = true;
  programs.broot.enable = true;
  programs.carapace.enable = true;
  programs.starship.enable = true;

  programs.lazygit.enable = true;
  programs.bat.enable = true;
  programs.fzf.enable = true;
  programs.jq.enable = true;
  programs.htop.enable = true;


  #  programs.jetbrains-remote.enable = true;
  #  programs.jetbrains-remote.ides = with pkgs.jetbrains; [ webstorm rust-rover clion pycharm-professional ];

  #  programs.ruff.enable = true;

  # Internet
  programs.firefox.enable = true;

  home.sessionVariables = {
    EDITOR = "hx";
    BROWSER = "firefox";
    SHELL = "${pkgs.nushell}/bin/nu";
    TERMINAL = "blackbox";
    TERM = "blackbox";
    COREPACK_HOME = "${config.home.homeDirectory}/.cache/corepack";
    # LD_LIBRARY_PATH= "$(nixglhost -p):$LD_LIBRARY_PATH";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };

  # nixGL.prefix = "${nixgl.auto.nixGLDefault}/bin/nixGL";
#  nixGL.prefix = "${nixgl.auto.nixGLNvidia}/bin/nixGLNvidia-550.67";
  # nixGL.prefix = "${nixglhost}/bin/nixglhost";
 # nixGL.prefix = "${nixglhost}/bin/nixglhost";

  # Enable 'zoxide' and 'zoxide' integration with 'nushell'
  imports = [
    (builtins.fetchurl {
        url = "https://raw.githubusercontent.com/Smona/home-manager/nixgl-compat/modules/misc/nixgl.nix";
        sha256 = "11f3pnkb1a4glghpgqhrd2mv02x8rraqa798hvi7zipj1874zjl2";
    })
    # Essentials
    ./programs/git.nix
    # Programming Languages
    ./groups/programming.nix
    ./groups/rust.nix
    ./groups/nix-language.nix
    ./groups/nodejs.nix
    ./groups/python.nix
    # Terminal
    ./groups/terminal.nix
    # ./programs/kitty.nix
    # Shell Configuration
    ./programs/nushell.nix
    ./programs/zoxide.nix
    ./programs/atuin.nix
    ./programs/direnv.nix
    # Additional Configuration of Nix
    ./programs/helix.nix
    ./programs/vscode.nix
    ./programs/jetbrains.nix
    ./nix.nix
    ./nixpkgs/default.nix
    #    ./gtk.nix
  ];

  # GUI Configuration
  xsession.enable = true;
  gtk.enable = true;
  qt.enable = true;
  services.blanket.enable = true;
  services.darkman.enable = true;
  services.activitywatch.enable = true;

  programs.rio = {
      enable = true;
      package = (nixGLwrap pkgs.rio);
  };

  programs.kitty = {
    enable = true;
    package = (nixGLwrap pkgs.kitty);
  };

}
