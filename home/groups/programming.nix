{ pkgs, ... }:

{
  home.packages = with pkgs; [

    act
    dprint
    # Build tools
    gcc
    cmake
    ccache
#    clang
    tinycc
    meson
    # Debuggers
    gdb
    lldb
    # Niche Languages
    gleam
    # Offline Documentation Browsers
    zeal
    cargo-docset
  ];
}
