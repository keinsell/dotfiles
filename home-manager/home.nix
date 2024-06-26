# Reference
# https://mynixos.com/
# https://searchix.alanpearce.eu/

{ config, pkgs, lib, ... }:
let
  sources = import ./npins/default.nix;
in
{
  imports = [
    (sources.catppuccin + "/modules/home-manager")
    ./modules/helix.nix
  ];

  # Enable settings that make Home Manager work better on
  # GNU/Linux distributions other than NixOS.
  targets.genericLinux.enable = false;

  nix = {
    # package = pkgs.nix;
    # settings.experimental-features = [ "nix-command" "flakes" ];
    gc.automatic = true;
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = pkg:
        builtins.elem (lib.getName pkg) [
          "joypixels"
        ];
      joypixels.acceptLicense = true;
    };
  };

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "keinsell";
  home.homeDirectory = "/home/${config.home.username}";
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.lsof
    pkgs.npins
    pkgs.zk
    pkgs.nb
    pkgs.unar
    pkgs.jq
    pkgs.poppler
    pkgs.fd
    pkgs.fzf
    pkgs._1password
    pkgs._1password-gui
    pkgs.nushell
    pkgs.nh
    pkgs.manix
    pkgs.nil
    pkgs.nixci
    pkgs.nixd
    pkgs.nixel
    pkgs.nixpacks
    pkgs.gleam
    pkgs.yaml-language-server
    pkgs.vdhcoapp
    pkgs.yt-dlp
    pkgs.aria2
    pkgs.persepolis
    pkgs.varia
    pkgs.ariang
    pkgs.bottom
    # pkgs.ccache
    pkgs.axel
    # pkgs.gcc
    # pkgs.automake
    # pkgs.pkgconf

    # Development Environemnt
    pkgs.daytona-bin
    pkgs.devenv
    pkgs.deadnix
    pkgs.comma
    pkgs.alejandra

    # Runtimes and Libraries
    pkgs.python311
    pkgs.go
    # pkgs.gopls

    # Rust
    pkgs.rustup
    # pkgs.rust-analyzer

    # Zig
    # pkgs.zls
    # pkgs.zig

    # Java
    # pkgs.gradle_c
    pkgs.zulu
    # pkgs.openjdk

    ## Kotlin
    pkgs.kotlin
    pkgs.kotlin-native
    pkgs.kotlin-language-server
    pkgs.detekt
    pkgs.ktfmt
    pkgs.ktlint

    ## Node.js
    pkgs.nodejs_22
    pkgs.typescript-language-server
    pkgs.pnpm
    pkgs.yarn
    pkgs.bun
    pkgs.deno
    pkgs.typescript
    pkgs.assemblyscript
    pkgs.nodePackages.tsun
    pkgs.nodePackages.ts-node
    pkgs.nodePackages.prisma
    pkgs.turbo
    pkgs.rslint
    pkgs.oxlint
    pkgs.ezno
    pkgs.edge-runtime
    pkgs.tyson
    pkgs.esbuild

    # Docker
    pkgs.nerdctl
    pkgs.docker
    pkgs.docker-compose
    pkgs.docker-buildx
    pkgs.containerd
    pkgs.dockerfile-language-server-nodejs
    pkgs.conmon
    pkgs.gvisor
    pkgs.earthly

    # Jetbrains
    pkgs.jetbrains-toolbox
    # pkgs.jetbrains.idea-ultimate

    # Communication
    pkgs.discord

    # Entertainment
    pkgs.spot
    pkgs.psst

    # TODO: Design and implement customized Typography (https://github.com/Jolg42/awesome-typography#fonts)
    (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" "Lilex" ]; })

    # pkgs.tailscale

    # GNOME (Just because bloat is fun!)
    pkgs.nautilus
    pkgs.mission-center

    # NetworkManager
    # pkgs.gnome.networkmanager-vpnc
    # pkgs.gnome.networkmanager-openvpn
    # pkgs.gnome.networkmanager-openconnect
    # pkgs.gnome.networkmanager-l2tp

    # pkgs.gnomeExtensions.tailscale-qs
    # pkgs.gnomeExtensions.wireguard-indicator
    # pkgs.gnomeExtensions.forge
    # pkgs.gnomeExtensions.blur-my-shell

    pkgs.gitmoji-cli
    pkgs.joypixels
    pkgs.lunarvim
  ];

  home.file = { };

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
    EDITOR = "${pkgs.helix}/bin/hx";
    PNPM_HOME = "/home/keinsell/.cache/pnpm";
    COREPACK_HOME = "/home/keinsell/.cache/corepack";
  };

  home.sessionPath = [
    "$HOME/.cache/pnpm/bin"
    "$HOME/.cargo/bin"
  ];

  programs = {
    home-manager.enable = true;
    lazygit.enable = true;
    yazi.enable = true;
    firefox = {
      enable = false;
    };
    nushell = {
      enable = true;
    };
    bash = {
      enable = false;
      enableVteIntegration = true;
    };
    zsh = {
      enable = true;
      zsh-abbr.enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      zprof.enable = false;
      syntaxHighlighting.enable = true;
      enableVteIntegration = true;

      dirHashes = {
        src = "/home/${config.home.username}/Projects";
        dots = "/home/${config.home.username}/.dotfiles";
      };
    };

    git = {
      package = pkgs.gitAndTools.gitFull;
      enable = true;
      userName = "Jakub Olan";
      userEmail = "keinsell@protonmail.com";
      aliases = {
        co = "checkout";
        ci = "commit";
        cia = "commit --amend";
        s = "status";
        st = "status";
        b = "branch";
        p = "pull --rebase";
        pu = "push";
      };
      iniContent = {
        branch.sort = "-committerdate";
        rerere.enabled = true;
        push.autoSetupRemote = true;
      };
      ignores = [ "*~" "*.swp" ];
      lfs.enable = true;
      delta = {
        enable = true;
        options = {
          features = "decorations";
          navigate = true;
          light = false;
          side-by-side = true;
        };
      };
      extraConfig = {
        init.defaultBranch = "trunk";
        core.editor = "helix";
        protocol.keybase.allow = "always";
        credential.helper = "store --file ~/.git-credentials";
        pull.rebase = "true";
      };
    };

    zoxide = {
      enable = true;
      options = [ "--cmd cd" ];
    };

    broot.enable = true;
    carapace.enable = true;

    starship = {
      enable = true;
      settings = {
        add_newline = false;
        line_break.disabled = true;
      };
    };

    zellij = {
      enable = true;
      enableZshIntegration = false;
      settings = {
        simplified_ui = true;
      };
    };

    eza = {
      enable = true;
      enableZshIntegration = true;
    };

    fzf.enable = true;
    fzf.enableZshIntegration = true;

    tealdeer.enable = true;
    navi.enable = true;

    direnv = {
      enable = true;
      nix-direnv.enable = true;
      silent = true;
    };

    dircolors.enable = true;
    thefuck.enable = true;
    atuin.enable = true;
    skim.enable = true;
    keychain.enable = true;
    gh.enable = true;

    # There is additional need to symlink
    # mise directory into asdf for Jetbrains
    # support
    #
    # ln -s ~/.local/share/mise ~/.asdf
    mise.enable = true;
    nix-index.enable = true;

    gnome-shell = {
      enable = true;
    };

    ripgrep.enable = true;
    bacon.enable = true;
    # ruff.enable = true;
    pylint.enable = true;
    poetry.enable = true;
    neovim.enable = true;
    gpg.enable = false;
    ssh.enable = false;
    ncspot = {
      enable = true;
    };
  };

  services = {
    gnome-keyring = {
      enable = true;
    };
    gpg-agent = {
      enable = true;
      defaultCacheTtl = 1800;
      enableSshSupport = true;
      enableExtraSocket = true;
    };
    lorri = {
      enable = true;
    };
    spotifyd = {
      enable = true;
    };
  };

  # ---------------------------------------------------
  # Theme
  # ---------------------------------------------------

  catppuccin.flavor = "mocha";
  # catppuccin.enable = true;
  catppuccin.pointerCursor.enable = true;

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
      name = "Tela-purple-dark";
      package = pkgs.tela-icon-theme;
    };
    theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
    };
  };
  dconf.enable = true;
  systemd = {
    # user.startServices = "sd-switch";
  };
  xsession.enable = true;
  fonts = {
    fontconfig = {
      enable = true;
    };
  };
  editorconfig.enable = true;
  xdg = { };
}
