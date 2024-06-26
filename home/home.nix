{ config, pkgs, ... }:

# with import <nixpkgs> {};
with builtins;
with lib;
# with import <home-manager/modules/lib/dag.nix> { inherit lib; };

{
 targets.genericLinux.enable = true;

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "keinsell";
  home.homeDirectory = "/home/keinsell";
  home.stateVersion = "24.05";
  home.packages = [
    pkgs.cowsay
    pkgs.starship
    pkgs.nushell
    pkgs.carapace
    pkgs.git
    pkgs.redisinsight
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" "FantasqueSansMono" "GeistMono" ]; })
    pkgs.fzf
    pkgs.ripgrep
    pkgs.fd
    pkgs.bat
    pkgs.neofetch
    # pkgs.firefox
    # Docker
    pkgs.docker
    pkgs.docker-buildx
    pkgs.docker-compose
    # Kubernetes
    pkgs.kubectl
    # Jetbrains IDEs
    pkgs.jetbrains.webstorm
    pkgs.jetbrains.clion
    pkgs.jetbrains.datagrip
    pkgs.jetbrains.rust-rover
    # Nix Development
    pkgs.cachix
    pkgs.nix-info
    pkgs.nixpkgs-fmt
    pkgs.nixci
    pkgs.nix-health
    pkgs.nil
    pkgs.nh
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
    "~/.config/helix/config.toml".source = ./helix/config.toml;
    "~/.config/helix/languages.toml".source = ./helix/languages.toml;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  programs.git = {
    enable = true;
    userName  = "keinsell";
    userEmail = "keisnell@protonmail.com";
    ignores = [ "*~" "*.swp" ];
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = "true";
    };
  };

  # Terminal Emulator
  programs.rio.enable = true;

  programs.lazygit.enable = true;
  programs.bat.enable = true;
  programs.fzf.enable = true;
  programs.jq.enable = true;
  programs.htop.enable = true;
  programs.carapace.enable = true;
  programs.jetbrains-remote.enable = true;
#  programs.jetbrains-remote.ides = with pkgs.jetbrains; [ webstorm rust-rover clion pycharm-professional ];

#  programs.ruff.enable = true;

  # Rust Development
  programs.bacon.enable = true;

  programs.yazi.enable = true;
  programs.thefuck.enable = true;
  programs.eza.enable = true;
  programs.broot.enable = true;



  #  programs.rio.enable = true;

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/keinsell/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "hx";
    BROWSER = "firefox";
    SHELL = "/home/keinsell/.nix-profile/bin/nu";
    TERMINAL = "rio";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
#    pkgs.nh = {
#      enable = true;
#      clean.enable = true;
#    };

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };

  programs.starship.enable = true;

  # Enable 'zoxide' and 'zoxide' integration with 'nushell'
  imports = [
    ./programs/nushell.nix
    ./programs/zoxide.nix
    ./programs/atuin.nix
    ./programs/direnv.nix
  ];

  # GUI Configuration
  xsession.enable = true;
#  programs.dconf.enable = true;

  services.blanket.enable = true;
  services.darkman.enable = true;

    gtk = {
      enable = true;

      gtk2 = {
        extraConfig = ''
          gtk-application-prefer-dark-theme=1
        '';
      };

      gtk3.extraConfig = { gtk-application-prefer-dark-theme = true; };

      gtk4.extraConfig = { gtk-application-prefer-dark-theme = true; };

      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.catppuccin-papirus-folders;
      };

      cursorTheme = {
        name = "Catppuccin-Mocha-Dark-Cursors";
        package = pkgs.catppuccin-cursors.mochaDark;
        size = 24;
      };

      theme = {
        name = "Catppuccin-Mocha-Standard-Blue-Dark";
        package = pkgs.catppuccin-gtk.override {
          accents = [ "blue" ];
          size = "standard";
          variant = "mocha";
        };
      };
    };

      home.pointerCursor = {
        gtk.enable = true;
        package = pkgs.catppuccin-cursors.mochaDark;
        name = "Catppuccin-Mocha-Dark-Cursors";
      };

      nix.gc.automatic = true;
}
