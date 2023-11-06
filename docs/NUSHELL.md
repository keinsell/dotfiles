# Setup A default

```bash
# Login Shell
which nu | chsh

# GNOME Console
gsettings set org.gnome.Console shell "['/usr/bin/nu']"
```


```bash
cargo install nu_plugin_highlight;
which nu_plugin_highlight | $env.nu_plugin_highlight_path;
register $env.nu_plugin_highlight_path
```