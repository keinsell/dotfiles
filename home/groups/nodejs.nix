{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nodejs_18
    pnpm
    bun
    deno
    turbo
    typescript
    tyson
    biome
    prettierd
    eslint_d
    rslint
    oxlint
    ezno
    yarn
    nodePackages.prisma
    nodePackages.prettier
    nodePackages.eslint
    nodePackages.typescript-language-server
    nodenv
  ];

  home.shellAliases = {
    yarn = "corepack yarn";
    yarnpkg = "corepack yarnpkg";
    pnpm = "corepack pnpm";
    pnpx = "corepack pnpx";
    npm = "corepack npm";
    npx = "corepack npx";
  };
}
