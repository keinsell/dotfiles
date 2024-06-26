{ pkgs, ... }:

{
  home.packages = with pkgs; [
    rustup
    #    pkgs.rustc
    #    pkgs.rust-analyzer
    #    pkgs.rustfmt
    #    pkgs.cargo
  ];

  programs.bacon.enable = true;
}
