{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ripgrep
    fd
    sd
    moreutils
    just
    asciinema
    gh
    entr
    hledger
    hledger-web
    gnupg
  ];

  fonts.fontconfig.enable = true;

  home.shellAliases = {
    #    e = "nvim";
    #    ee = "nvim $(fzf)";
    #    g = "git";
    #    lg = "lazygit";
    #    l = "ls";
    #    beep = "say 'beep'";
  };

  programs = {
    nix-index = {
      enable = true;
      enableZshIntegration = true;
    };
    lsd = {
      enable = true;
      enableAliases = true;
    };
    bat.enable = true;
    autojump.enable = false;
    zoxide.enable = true;
    fzf.enable = true;
    jq.enable = true;
    htop.enable = true;
    rio.enable = true;
    keychain.enable = true;
  };
}
