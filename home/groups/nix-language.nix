{ pkgs, ... }:

{
  home.packages = with pkgs; [
    cachix
    nix-info
    nixpkgs-fmt
    nixci
    nix-health
    nil
    nh
  ];
}
