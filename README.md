# "The Taste of Unix"

> While I own multiple devices and these dotfiles we're always somehow portable to MacOS (not hyprland itself) - my Macbook died as it's seem they do not tolerate can of Redbull and this repository will be maintained nad intented to reproduce only on Arch Linux (here: CachyOS), by the end of the year I'll be switching to NixOS.

Theme ideas:

- "Natural", the calm composition made on color of the forest.
- "Sakura", the calm compositon base on bloomson and pink colors.
- "Cyberpunk", dark colors with vibrant accents.


### Naturalish

| Spec      | Value | Description |
| ----------- | ----------- | ---- |
| Operating System      |   `cachyos-x86_64`     | |
| Shell   | `fish`        | |
| Shell Prompt | | |
| Desktop Environment | `hyprland` | Experimental desktop environment, which I've choose after using GNOME for past 6 years. |
| GTK-Theme     | `everforest` | Available as `everforest-gtk-theme-git` package in AUR repository. |
| Theme | `everforest` | |
| Icons | | |
| Terminal | | |
| Notification Bar | `eww` | |
| Dock | | |

### Cypherpunkish

- GTK: [`tokyonight`](https://github.com/Fausto-Korpsvart/Tokyo-Night-GTK-Theme)

## Installation

```
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME
```


## Utilities

- [ThemeChanger](https://github.com/ALEX11BR/ThemeChanger), [Gradience](https://flathub.org/apps/com.github.GradienceTeam.Gradience) for modifing themes of `Qt` and `Gtk` applications.
