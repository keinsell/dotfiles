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
ame -S --noconfirm 1password 1password-cli jetbrains-toolbox gitkraken discord nushell zoxide fzf github-desktop-bin npm pnpm yarn alacritty-git visual-studio-code-bin docker nvidia docker-desktop timeshift-autosnap firefox obsidian-bin pueue kubo postman-bin spacedrive-bin ipfs-desktop anytype-bin signal-desktop mailspring termius
```

- https://archlinux.org/packages/extra/x86_64/deja-dup/
- gnhttps://archlinux.org/packages/extra/x86_64/gnome-logs/
- https://archlinux.org/packages/extra/x86_64/gnome-builder/
- https://archlinux.org/packages/extra/x86_64/d-spy/
- https://archlinux.org/packages/extra/x86_64/epiphany/
https://archlinux.org/packages/extra/x86_64/geary/
https://archlinux.org/packages/extra/x86_64/ghex/
https://archlinux.org/packages/extra/x86_64/gjs/
https://archlinux.org/packages/extra/x86_64/gnac/
https://archlinux.org/packages/extra/x86_64/gnome-boxes/
https://archlinux.org/packages/extra/x86_64/gloobus-preview/
https://aur.archlinux.org/packages/upscaler
https://archlinux.org/packages/extra/x86_64/newsflash/

gnome-remote-desktop
gnome-connections
gnome-maps

https://aur.archlinux.org/packages/collision
https://aur.archlinux.org/packages/wike
https://archlinux.org/packages/extra/x86_64/seahorse/
https://archlinux.org/packages/extra/x86_64/seahorse-nautilus/

### Nvidia

```
ame -S --noconfirm nvidia-cg-toolkit cudnn cuda-tools cuda nvidia-settings
```

### Internet

- [`fragments`](https://archlinux.org/packages/extra/x86_64/fragments/). BitTorrent client for GNOME

### Productivity

- `geary`/`mailspring`
- [`dialect`](https://aur.archlinux.org/packages/dialect). A translation app for GNOME.


```
ame -S --noconfirm dialect
```

### Documents

- [`pdfmixtool`](https://scarpetta.eu/pdfmixtool)

### Music

### Utility

- [`shutter`](https://shutter-project.org/), Screenshot editing tool.
- [`activitywatch-bin`](), Automated Time-Tracking Tool
- [`flatseal`](https://aur.archlinux.org/packages/flatseal). A permissions manager for Flatpak.
- [`impression`](https://aur.archlinux.org/packages/impression). A straight-forward modern application to create bootable drives.
- [`warp`](https://aur.archlinux.org/packages/warp). Fast and secure file transfer

```
ame -S --noconfirm shutter activitywatch-bin flatseal impression warp
```

### Graphic Design

- [`pinta`](https://www.pinta-project.com/),
- [`blender`]()

### Media

- [`handbrake`](https://handbrake.fr). HandBrake is a open-source tool, built by volunteers, for converting video from nearly any format to a selection of modern, widely supported codecs.
- [`upscayl-bin`](https://aur.archlinux.org/packages/upscayl-bin). Upscayl is a free and open source desktop application that lets you upscale your low resolution images using advanced AI Models.
- 


```
ame -S --noconfirm yt-dlp parabolic vdhcoapp
```

```
https://github.com/jpochyla/psst
https://github.com/xou816/spot
https://github.com/Spotifyd/spotifyd
https://github.com/hrkfdn/ncspot
https://github.com/Rigellute/spotify-tui
https://github.com/kraxarn/spotify-qt
https://spicetify.app/
```

### Developer Tools

- `curl https://cli.configu.com/install.sh | sh`, **Configu** is a new standard for managing configurations in software projects.


### Privacy

- `ProtonVPN` - https://wiki.archlinux.org/title/ProtonVPN#Setup

```
ame -S --noconfirm 
```

### Windows Portability

- [`bottles`](https://usebottles.com/)
- [`lutris`](https://lutris.net/)
- [`wine`](https://www.winehq.org), Wine is a compatibility layer for running Windows applications that has been the primary choice of many Linux users who rely on running such programs.

#### Kubernetes

```
ame -S --noconfirm minikube helm kind
```

```
alias kubectl="minikube kubectl --"
# OR
ln -s $(which minikube) /usr/local/bin/kubectl 
```

### Ulauncher

```bash
# Run at login
systemctl --user enable --now ulauncher
```

### Self-Hosting

- https://twake.app/