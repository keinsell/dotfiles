{ pkgs, config, home, ... }:
{
  programs.nushell = {
    enable = true;
    envFile.source = ./nushell/env.nu;
    configFile.source = ./nushell/config.nu;
    inherit (config.home) shellAliases;
  };

  #  home.packages = with pkgs.nushellPlugins; [
  #    nushell_plugin_query
  #    nushell_plugin_gstat
  #    nushell_plugin_formats
  #  ];

  home.file."~/.config/nushell/config.nu".source = ./nushell/config.nu;
  home.file."~/.config/nushell/env.nu".source = ./nushell/env.nu;
}
