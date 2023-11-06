# Setup A default

```bash
# Login Shell
which nu | chsh

# GNOME Console
gsettings set org.gnome.Console shell "['/usr/bin/nu']"
```

### `zoxide` Integration

```
ame -S --noconfirm zoxide;
zoxide init --hook pwd nushell | save -f ($nu.default-config-dir | path join 'integration' | path join "zoxide.nu");
```


```bash
cargo install nu_plugin_highlight;
which nu_plugin_highlight | $env.nu_plugin_highlight_path;
register $env.nu_plugin_highlight_path
```