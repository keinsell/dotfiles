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
    # (sources.stylix).homeManagerModules.stylix
    ./modules/helix.nix
    ./modules/common/default.nix
  ];

  # Enable settings that make Home Manager work better on
  # GNU/Linux distributions other than NixOS.
  targets.genericLinux.enable = true;

  home.username = "keinsell";
  home.homeDirectory = "/home/${config.home.username}";
  home.stateVersion = "24.05";

  # stylix.enable = true;

  home.packages = [
    pkgs.lsof
    pkgs.npins
    pkgs.zk
    pkgs.nb
    pkgs.unar
    pkgs.inshellisense
    pkgs.jq
    pkgs.poppler
    pkgs.fd
    pkgs.fzf
    pkgs.wluma
    pkgs._1password
    pkgs._1password-gui
    pkgs.nushell
    pkgs.nh
    pkgs.manix
    pkgs.nil
    pkgs.niv
    pkgs.nixci
    pkgs.nixd
    pkgs.nixel
    pkgs.nixpacks
    pkgs.gleam
    pkgs.yaml-language-server
    pkgs.vdhcoapp
    pkgs.aria2
    pkgs.persepolis
    pkgs.varia
    pkgs.ariang
    pkgs.bottom
    pkgs.ccache
    pkgs.axel
    pkgs.gcc
    pkgs.automake
    pkgs.pkgconf

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
    # pkgs.nodePackages.prisma
    pkgs.turbo
    pkgs.rslint
    pkgs.oxlint
    pkgs.ezno
    # pkgs.edge-runtime
    pkgs.tyson
    pkgs.esbuild
    pkgs.nerdctl
    pkgs.docker
    pkgs.docker-compose
    pkgs.docker-buildx
    pkgs.docker-sync
    pkgs.lazydocker
    pkgs.dapper
    pkgs.cadvisor
    pkgs.docui
    pkgs.dive
    pkgs.diffoci
    pkgs.rootlesskit
    pkgs.kind
    pkgs.kompose
    pkgs.oxker
    pkgs.containerd
    pkgs.dockerfile-language-server-nodejs
    pkgs.conmon
    pkgs.gvisor
    pkgs.earthly
    pkgs.jetbrains-toolbox
    pkgs.jetbrains.idea-ultimate
    pkgs.armcord
    pkgs.spot
    pkgs.psst
    pkgs.git-town
    pkgs.git-extras
    pkgs.git-fame
    pkgs.bcachefs-tools
    # TODO: Design and implement customized Typography (https://github.com/Jolg42/awesome-typography#fonts)
    (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" "Lilex" ]; })
    # pkgs.tailscale

    # NetworkManager
    # pkgs.gnome.networkmanager-vpnc
    # pkgs.gnome.networkmanager-openvpn
    # pkgs.gnome.networkmanager-openconnect
    # pkgs.gnome.networkmanager-l2tp
    # pkgs.gnomeExtensions.tailscale-qs
    # pkgs.gnomeExtensions.wireguard-indicator


    pkgs.gitmoji-cli
    pkgs.lunarvim
    pkgs.tokei
    pkgs.scc
    pkgs.gitstats
    pkgs.git-town
    pkgs.git-annex
    pkgs.gitfs
    pkgs.git-cliff
    pkgs.git-codeowners
    pkgs.gitleaks
    pkgs.gitless
    pkgs.jrnl
    pkgs.gitu
    pkgs.difftastic
    pkgs.git-credential-manager
    pkgs.meld
  ];

  home.file = { };

  home.sessionVariables = {
    EDITOR = "${pkgs.helix}/bin/hx";
    PNPM_HOME = "/home/keinsell/.cache/pnpm";
    COREPACK_HOME = "/home/keinsell/.cache/corepack";
    # ZELLIJ_AUTO_ATTACH = true;
  };

  home.sessionPath = [
    "$HOME/.cache/pnpm/bin"
    "$HOME/.cargo/bin"
  ];

  home.extraOutputsToInstall = [ "doc" "info" "devdoc" ];
  home.preferXdgDirectories = true;

  programs = {
    home-manager.enable = true;
    browserpass.enable = true;
    jujutsu.enable = true;
    mpv.enable = true;
    scmpuff.enable = true;
    urxvt.enable = true;
    watson.enable = true;
    lazygit = {
      enable = true;
      settings = {
        gui = {
          lightTheme = true;
        };
        git = {
          paging = {
            colorArg = "always";
            useConfig = false;
            externalDiffCommand = "difft --color=always";
          };
        };
      };
    };
    rofi.enable = true;
    firefox = {
      enable = true;
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
    pandoc = { enable = true; };

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
      ignores = [ "*~" "*.swp" "node_modules" ".direnv" ".cache" ];
      lfs = {
        enable = true;
        skipSmudge = true;
      };
      delta = {
        enable = false;
        options = {
          features = "decorations";
          navigate = true;
          side-by-side = true;
        };
      };
      difftastic = {
        enable = false;
      };
      extraConfig = {
        init.defaultBranch = "trunk";
        merge = {
          conflictstyle = "diff3";
          autoStash = true;
          guitool = "meld";
        };
        mergetool = {
          meld.useAutoMerge = true;
          keepBackup = true;
        };
        interactive = { };
        diff = {
          algorithm = "histogram";
          colorMoved = "default";
        };
        credential = {

          credentialStore = "secretservice";
          cacheOptions = "--timeout 3000";
          helper = "${pkgs.git-credential-manager}/bin/git-credential-manager";
        };
        core.editor = "helix";
        protocol.keybase.allow = "always";
        pull = {
          ff = true;
          rebase = true;
        };
        pack = {};
        rerere = {
          autoUpdate = true;
          enabled = true;
        };
        rebase = {
          autoStash = true;
        };
        extensions = {
          refStorage = "reftable";
        };
        feature.experimental = true;
      };
    };

    zoxide = {
      enable = true;
      options = [ "--cmd cd" ];
    };
    feh.enable = true;
    fastfetch = {
      enable = true;
      settings = {
        logo = {
          source = "nixos_small";
          padding = {
            right = 1;
          };
        };
        display = {
          binaryPrefix = "si";
          color = "blue";
          separator = "  ";
        };
        modules = [
          {
            type = "datetime";
            key = "Date";
            format = "{1}-{3}-{11}";
          }
          {
            type = "datetime";
            key = "Time";
            format = "{14}:{17}:{20}";
          }
          "break"
          "player"
          "media"
        ];
      };
    };
    himalaya = {
      enable = true;
    };
    notmuch = { enable = false; };
    broot.enable = true;
    carapace.enable = true;

    starship = {
      enable = true;
      settings = {
        add_newline = false;
        line_break.disabled = true;
      };
    };

    gitui = {
      enable = true;
    };

    zellij = {
      enable = true;
      enableZshIntegration = false;
      settings = {
        simplified_ui = false;
        theme = "catppuccin-mocha";
        default_shell = "${pkgs.nushell}/bin/nu";
        on_force_close = "quit";
        default_layout = "compact";
        ui = {
          pane_frames = {
            rounded_corners = true;
            hide_session_name = true;
          };
        };
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
    };

    dircolors.enable = true;
    thefuck = {
      enable = true;
      enableInstantMode = true;
    };
    atuin.enable = true;
    skim.enable = true;
    keychain.enable = true;
    gh.enable = true;
    texlive = {
      enable = true;
    };

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
    k9s = {
      enable = true;
    };
    foot = {
      enable = true;
    };
    zk = { enable = true; };
    password-store = { enable = true; };
    yt-dlp = {
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
      enable = false;
    };
    spotifyd = {
      enable = true;
    };
  };

  # ---------------------------------------------------
  # Theme
  # ---------------------------------------------------

  catppuccin = {
    flavor = "mocha";
    pointerCursor.enable = false;
  };


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
  editorconfig = {
    enable = true;
    settings = {
      "*" = {
        max_line_width = 80;
      };
    };
  };
  xdg = { };
}
