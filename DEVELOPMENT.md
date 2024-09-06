# Development

There is a lot of frameworks dedicated for dotfile management yet they all feel overly complicated for simple thing which is symlinking files from point A to point B. For this purpose I've decided to use `GNU Stow` as hassle-free tool.

## Creating a new dotifle

```
touch mynewdotfile
git add mynewdotfile
git commit -m "mynewdotfile"
cd ~
ls -s .dotfiles/mynewdotfile .mydotfile
```
