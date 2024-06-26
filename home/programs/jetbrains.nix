{ pkgs, config, home, ... }:

# https://nixos.wiki/wiki/Jetbrains_Tools
{
    # https://github.com/benys/nixos/blob/4bd1bd8519e5ba3091a42c492ce2445e38195232/modules/dev/dotnet.nix#L15C1-L29C5
  home.packages = with pkgs.jetbrains; [
    webstorm
    clion
    datagrip
    writerside
    rust-rover
    pycharm-professional
    idea-ultimate
    goland
    gateway
    jdk
#     (plugins.addPlugins idea-ultimate [
#     "vscode-keymap"
#     # https://github.com/NixOS/nixpkgs/blob/master/pkgs/applications/editors/jetbrains/plugins/plugins.json
##         "github-copilot"
##         "ideavim"
##         "nixidea"
##         "ide-features-trainer"
#    ])
  ];
}
