{ config, lib, pkgs, ... }: {
  nix = {
    package = pkgs.nix;
    gc.automatic = true;
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
      trusted-users = [ "root" "keinsell" ];
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = pkg:
        builtins.elem (lib.getName pkg) [
          "joypixels"
        ];
      permittedInsecurePackages = [
        "electron-27.3.11"
      ];
      input-fonts.acceptLicense = true;
      joypixels.acceptLicense = true;
      packageOverrides = pkgs: {
        nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
          inherit pkgs;
        };
      };
    };
  };

  services = { } // lib.attrsets.optionalAttrs (builtins.hasAttr "nix-daemon" config.services) {
    nix-daemon.enable = true;
  };
}
