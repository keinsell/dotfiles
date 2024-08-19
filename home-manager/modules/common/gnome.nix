{ config, pkgs, stdenv, lib, ... }: {
  home.packages = [
    pkgs.gnome.zenity
    pkgs.gnome.sushi
    pkgs.gnome.seahorse
    pkgs.gnome.rygel
    pkgs.gnome.gvfs
    pkgs.gnome.gnome-tweaks
    pkgs.gnome.gnome-software
    pkgs.gnome.gnome-shell-extensions
    pkgs.gnome-extension-manager
    pkgs.gnomeExtensions.forge
    pkgs.gnome-extensions-cli
    pkgs.gnome-browser-connector
    pkgs.gnomeExtensions.blur-my-shell
    pkgs.gnomeExtensions.zen
    pkgs.gnomeExtensions.vitals
    pkgs.gnomeExtensions.runcat
    pkgs.gnome-keyring
    pkgs.gnome-autoar
    pkgs.gnome-calendar
    pkgs.gnome-desktop
    pkgs.nautilus
    pkgs.mission-center
    pkgs.evolution
    pkgs.resources
    pkgs.gnome-contacts
  ];

  dconf.settings = {
    "org/gnome/mutter" = {
      experimental-features = [
        "scale-monitor-framebuffer"
        "kms-modifiers"
        "variable-refresh-rate"
      ];
      dynamic-workspaces = true;
      center-new-windows = true;
      edge-tiling = true;
    };
    "org/gnome/shell" = {
      disable-user-extensions = false;
      app-picker-view = "frequent";
    };
    "org/gnome/desktop/interface" = {
      enable-hot-corners = true;
      show-battery-percentage = true;
      enable-animations = true;
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
    };
    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-schedule-automatic = true;
    };
  };
}
