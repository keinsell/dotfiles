{ config, lib, ... }: {
  imports = [
    ./nix.nix
    ./gnome.nix
    ./fonts.nix
  ];

  # config.home-manager = {
  #   useGlobalPkgs = true;
  #   useUserPackages = true;
  #   users.${config.user}.home.stateVersion = "24.05";
  # };

  # options = {
  #   user = lib.mkOption {
  #     type = lib.types.str;
  #     description = "Primary user of the system";
  #   };

  #   personal.enable = lib.mkEnableOption "Personal setup";
  # };
}
