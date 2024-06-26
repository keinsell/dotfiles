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
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
    "~/.config/nushell/config.nu".source = ./nushell/config.nu;
    "~/.config/nushell/env.nu".source = ./nushell/env.nu;
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
  programs.lazygit.enable = true;
  programs.bat.enable = true;
  programs.zoxide.enable = true;
  programs.fzf.enable = true;
  programs.jq.enable = true;
  programs.htop.enable = true;

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
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;


#  imports = [
#    ./helix.nix
#  ];

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };

  programs.starship.enable = true;

  programs.nushell = {
      enable = true;
      envFile.source = ./nushell/env.nu;
      configFile.source = ./nushell/config.nu;
      inherit (config.home) shellAliases;
  };

  # GUI Configuration
  xsession.enable = true;
#  programs.dconf.enable = true;

  services.blanket.enable = true;
}
