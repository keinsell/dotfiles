{ pkgs, config, home, ... }:
{
   programs.nushell = {
         enable = true;
         envFile.source = ./nushell/env.nu;
         configFile.source = ./nushell/config.nu;
         inherit (config.home) shellAliases;
   };

   home.file."~/.config/nushell/config.nu".source = ./nushell/config.nu;
   home.file."~/.config/nushell/env.nu".source = ./nushell/env.nu;
}