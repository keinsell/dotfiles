{ config, pkgs, stdenv, lib, ... }: {
  home.packages = with pkgs; [
                           font-awesome
                           input-fonts
                           joypixels
                           (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" "FantasqueSansMono" "Lilex" ]; })
                         ];
 fonts.fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "FantasqueSansMono" ];
        # TODO(https://github.com/NixOS/nixpkgs/issues/312826): Migrate into Fluent Emoji
        emoji = [ "JoyPixels" ];
   };
   };
}
