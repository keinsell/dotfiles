{ pkgs ? import <nixpkgs> { }, lib ? pkgs.lib }:

let
  nixglhost-sources = pkgs.fetchFromGitHub {
    owner = "numtide";
    repo = "nix-gl-host";
    rev = "main";
    # Replace this with the hash Nix will complain about, TOFU style.
    hash = "";
  };

  nixglhost = pkgs.callPackage "${nixglhost-sources}/default.nix" { };

in pkgs.mkShell {
  buildInputs = [
    nixglhost
  ];
}
