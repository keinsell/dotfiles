{ pkgs, ... }:

{
  programs.helix = {
    enable = true;
    settings = {
      theme = "catppuccin_mocha";
      editor = {
        line-number = "relative";
        mouse = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        completion-trigger-len = 2;
        true-color = true;
        color-modes = true;
        popup-border = "all";
        soft-wrap = {
          enable = true;
          max-wrap = 80;
        };
        file-picker = {
          hidden = true;
          parents = false;
          git-ignore = false;
          git-exclude = false;
          git-global = true;
          max-depth = 4;
        };
        indent-guides = {
          render = true;
        };
        smart-tab = {
          enable = true;
          supersede-menu = false;
        };
        lsp = {
          enable = true;
          display-messages = true;
          display-inlay-hints = true;
          auto-signature-help = true;
          snippets = true;
        };
        auto-completion = true;
        auto-format = true;
        completion-replace = true;
        auto-save = {
          focus-lost = true;
          after-delay.enable = true;
        };
      };
      keys.normal = {
        space.space = "workspace_symbol_picker";
        tab = "move_parent_node_end";
        S-tab = "move_parent_node_start";
      };
      keys.insert = {
        S-tab = "move_parent_node_start";
      };
      keys.select = {
        tab = "extend_parent_node_end";
        S-tab = "extend_parent_node_start";
      };
    };

    # https://github.com/helix-editor/helix/blob/master/languages.toml
    languages = {
      language-server = {
        # https://github.com/neoclide/coc-tsserver
        # https://github.com/typescript-language-server/typescript-language-server
        typescript-language-server = {
          command = "typescript-language-server";
          # args = [ "--stdio" ];
          config = {
            hostInfo = "helix";
            completionDisableFilterText = true;
            tsserver = {
              useSyntaxServer = "auto";
              implicitProjectConfig = {
                target = "ESNext";
                module = "NodeNext";
                checkJs = true;
                strictNullChecks = true;
                experimentalDecorators = true;
                useLocalTsdk = true;
              };
              experimental = {
                enableProjectDiagnostics = true;
              };
            };
            preferences = {
              lazyConfiguredProjectsFromExternalProject = true;
            };
            typescript.updateImportsOnFileMove.enabled = "always";
            typescript.workspaceSymbols.scope = "currentProject";
            typescript.preferGoToSourceDefinition = true;
            typescript.implementationsCodeLens.enabled = true;
            typescript.referencesCodeLens.enabled = true;
            typescript.referencesCodeLens.showOnAllFunctions = true;
            implicitProjectConfiguration.checkJs = true;
            implicitProjectConfiguration.experimentalDecorators = true;
            implicitProjectConfiguration.module = "NodeNext";
            implicitProjectConfiguration.target = "ESNext";
          };
        };

        biome = {
          command = "biome";
          args = [ "lsp-proxy" ];
        };

        nil = {
          command = "nil";
          config.nil = {
            formatting.command = [ "${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt" ];
            nix.flake.autoEvalInputs = true;
          };
        };

        # Nix language server, based on nix libraries
        # https://github.com/nix-community/nixd
        #
        # Previously rnix-lsp was widely used for autocompletion which is now implemented in manix. As time flows nixd was released which provide functionality of rnix-lsp and the nil aims to be performance-oriented language server yet it od not provide much features now.

        nixd = {
          command = "nixd";
          args = [ "--inlay-hints" "--semantic-tokens" ];
        };

        zk = {
          command = "zk";
          args = [ "lsp" ];
        };

        rust-analyzer = {
          config.rust-analyzer = {
            cargo.loadOutDirsFromCheck = true;
            checkOnSave.command = "clippy";
            procMacro.enable = true;
            lens = { references = true; methodReferences = true; };
            completion.autoimport.enable = true;
            experimental.procAttrMacros = true;
          };
        };
      };

      # Setup individual configuration for
      # every programming language that I'm using.
      language = [
        {
          name = "markdown";
          scope = "source.md";
          injection-regex = "md|markdown";
          file-types = [ "md" "markdown" "mdx" "mkd" "mkdn" "mdwn" "mdown" "markdn" "mdtxt" "mdtext" "workbook" { glob = "PULLREQ_EDITMSG"; } ];
          roots = [ ".marksman.toml" ];
          language-servers = [ "zk" "marksman" "markdown-oxide" ];
          indent = { tab-width = 2; unit = "  "; };
          block-comment-tokens = { start = "<!--"; end = "-->"; };
        }
        {
          name = "nix";
          auto-format = true;
          language-servers = [ "nixd" "nil" ];
        }
        {
          name = "javascript";
          language-servers = [
            {
              name = "typescript-language-server";
              except-features = [ "format" ];
            }
            "biome"
          ];
          auto-format = true;
        }
        {
          name = "typescript";
          file-types = ["ts"];
          roots = ["tsconfig.json" "package.json"];
          language-servers = [
            {

              except-features = [ "format" ];
              name = "typescript-language-server";
            }
            "biome"
          ];
          auto-format = true;
        }
        {
          name = "tsx";
          language-servers = [
            {
              name = "typescript-language-server";
              except-features = [ "format" ];
            }
            "biome"
          ];
          auto-format = true;
        }
        {
          name = "jsx";
          language-servers = [
            {
              name = "typescript-language-server";
              except-features = [ "format" ];
            }
            "biome"
          ];
          auto-format = true;
        }
      ];
    };
    # TODO: Ingtegrate diagnostic-languageserver
    # TODO: integrate efm-langserver
    # TODO: Add prisma-language-server
    # TODO: sonarlint-ls
    # TODO: autotools-language-server
    # TODO: terraform-lsp
    # TODO: sql-language-server
    # TODO: vala-language-server
    # TODO: cquery
    # TODO: cmake-language-server
    # TODO: vim-language-server
    # TODO: terraform-ls
    # TODO: vim-ale
    # TODO: typst-lsp
    # TODO bingo-git
    # TODO: eslint-language-server
    # TODO: ansible-language-server
    # TODO: termux-language-server
    # TODO: digestif
    # TODO: gradle-language-server
    # TODO: simple-completion-language-server
    # TODO: vtsls

    # Helix-related packages
    # I do not like installing and configuring
    # tons of things to make something working,
    # storage is cheap nowadays and it's better
    # to just install everything that I'm using.

    extraPackages = with pkgs; [
      autotools-language-server
      statix
      bash-language-server
      typst-live
      texlab
      nixpkgs-fmt
      nil
      ripgrep
      zls
      lldb
      xsel
      typescript
      typescript-language-server
      jsonnet-language-server
      yaml-language-server
      rust-analyzer
      biome
      marksman
      taplo
      lldb
      sonarlint-ls
      lsp-plugins
      markdown-oxide
      koka
      prqlc
      quickjs-ng
      hadolint
      javascript-typescript-langserver
      helix-gpt
      ansible-language-server
      autotools-language-server
      cmake-language-server
      bash-language-server
      spectral-language-server
      vala-language-server
      buf-language-server
      dockerfile-language-server-nodejs
      nodePackages.graphql-language-service-cli
      jq-lsp
      terraform-lsp
      postgres-lsp
      htmx-lsp
      typos-lsp
      stylelint-lsp
      # typst-lsp
      ruff-lsp
      dhall-lsp-server
      ltex-ls
      hyprls
      # llm-ls
      zls
      vale-ls
      vscode-js-debug
      eslint_d
      vscode-langservers-extracted
      nodePackages.eslint
      eslint_d
      diagnostic-languageserver
    ];

    ignores = [
      "/build/"
      "/target/"
      "/node_modules/"
      "/dist/"
    ];
  };
}
