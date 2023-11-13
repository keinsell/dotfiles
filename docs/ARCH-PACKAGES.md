# ArchLinux

## Pacman Wrapper

There's a lot of pacman wrappers out there, however the ones I've liked by simplicity and nice user experience is [`ame`](https://aur.archlinux.org/packages/ame) from developers of Crystal Linux, I have used `yay` a good few years ago and it was good actually I would think about usage of [`aura`](https://fosskers.github.io/aura/). `paru` may work too.

On Debian I had habit to use `nala` wrapper for managing packages.

## Desktop Environment

I really like tiling window managers, yet I could never give up on "traditional" desktop environment. Personally I would stick to GNOME as KDE doesn't seem right to me.

- [Forge](https://extensions.gnome.org/extension/4481/forge/), tiling window manager for GNOME deesktop.
- [Rounded Window Corners](https://extensions.gnome.org/extension/5237/rounded-window-corners/)
- [Audio Switcher](https://extensions.gnome.org/extension/1092/audio-switcher/)
- [Blur my Shell](https://extensions.gnome.org/extension/3193/blur-my-shell/)
- [GSConnect](https://extensions.gnome.org/extension/1319/gsconnect/)
- [Arcmenu](https://extensions.gnome.org/extension/3628/arcmenu/)
- [Vitals](https://extensions.gnome.org/extension/1460/vitals/)
- [Floating Dock](https://extensions.gnome.org/extension/3730/floating-dock/)
- [Arch Linux Updates Indicator](https://extensions.gnome.org/extension/1010/archlinux-updates-indicator/)
- [Rounded Corners](https://extensions.gnome.org/extension/1514/rounded-corners/)
- [Grand Theft Focus](https://extensions.gnome.org/extension/5410/grand-theft-focus/)


### Additional

```
ame -S --noconfirm 1password jetbrains-toolbox gitkraken discord nushell zoxide fzf github-desktop-bin npm pnpm yarn alacritty-git visual-studio-code-bin docker nvidia docker-desktop timeshift-autosnap firefox obsidian-bin pueue kubo postman-bin spacedrive-bin ipfs-desktop anytype-bin signal-desktop mailspring termius
```

### Music

```
https://github.com/jpochyla/psst
https://github.com/xou816/spot
https://github.com/Spotifyd/spotifyd
https://github.com/hrkfdn/ncspot
https://github.com/Rigellute/spotify-tui
https://github.com/kraxarn/spotify-qt
https://spicetify.app/
```

### Ulauncher

```bash
# Run at login
systemctl --user enable --now ulauncher
```