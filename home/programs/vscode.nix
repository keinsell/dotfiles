{ pkgs, ... }:
{
  programs.vscode.enable = true;
  programs.vscode.extensions = with pkgs.vscode-extensions; [
    bbenoist.nix
    jnoortheen.nix-ide
    rust-lang.rust-analyzer
    ms-vscode-remote.remote-containers
    ms-azuretools.vscode-docker
    ms-kubernetes-tools.vscode-kubernetes-tools
    ms-vscode.cpptools
    ms-python.python
    ms-python.debugpy
    ms-vscode.makefile-tools
    #    ms-vscode.js-debug
    github.copilot
    github.copilot-chat
    biomejs.biome
    #    ms-vscode.vscode-typescript
    #    alberto-varela.unsafe-typescript
    usernamehw.errorlens
    yoavbls.pretty-ts-errors
  ];
}
