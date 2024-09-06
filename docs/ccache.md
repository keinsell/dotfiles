# ccache

> ccache is a compiler wrapper that stores on disk the compiled binaries and offers them back to speed up any eventual recompilation of the same code. While it may take a few seconds longer to compile a program the first time, subsequent compiles will be much faster as no proper compilation is made, only a lookup through the previously stored binaries. ccache is compatible with GCC and Clang.

```bash
paru -S --noconfirm ccache	
```

```conf
# /etc/makepkg.conf
BUILDENV=(!distcc color ccache check !sign)
````
