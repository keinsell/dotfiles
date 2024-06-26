{ pkgs, ... }:
{
  programs.atuin.enable = true;
  programs.atuin.enableNushellIntegration = true;
  programs.atuin.settings = {
    db_path = "~/.history.db";
    #        store_failed = false;
    #        secrets_filter = false;
  };
}


