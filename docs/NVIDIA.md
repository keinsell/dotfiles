# Nvidia

##  `mkinitcpio`` modules

`/etc/mkinitcpio.conf`

```
MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)
```

```
sudo mkinitcpio -P
```

## Kernel Flag

`/etc/default/grub`

```
GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet nvidia_drm.modeset=1"
```

```bash
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

## Wayland

GDM uses some custom [`udev` rules](https://gitlab.gnome.org/GNOME/gdm/-/blob/main/data/61-gdm.rules.in) which may fail when using wayland.

### Disable GDM udev that disables wayland

```
sudo ln -s /dev/null /etc/udev/rules.d/61-gdm.rules
```

