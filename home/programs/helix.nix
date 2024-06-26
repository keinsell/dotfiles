{ pkgs, ... }:
{
  # helix --health
  # helix -g fetch
  programs.helix.defaultEditor = true;
  programs.helix.enable = true;

  programs.helix.languages = {
    language-server.typescript-language-server = with pkgs.nodePackages; {
      command = "${typescript-language-server}/bin/typescript-language-server";
      args = [ "--stdio" "--tsserver-path=${typescript}/lib/node_modules/typescript/lib" ];
    };

    language = [{
      name = "rust";
      auto-format = false;
    }];
  };

  programs.helix.settings = {
    editor = {
      line-number = "relative";
      lsp.display-messages = true;
      mouse = true;
      cursor-shape = {
        insert = "bar";
        normal = "block";
        select = "underline";
      };
      file-picker = {
        hidden = false;
      };
    };
  };
}
