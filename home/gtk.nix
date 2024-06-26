{ pkgs, ... }:
{
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
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders;
    };

    cursorTheme = {
      package = pkgs.apple_cursor;
      size = 24;
    };

    theme = {
      name = "Ayu-Dark";
      package = pkgs.ayu-theme-gtk;
    };
  };

  home.pointerCursor = {
    gtk.enable = true;

    package = pkgs.apple_cursor;
  };
}
