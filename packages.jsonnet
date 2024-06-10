{
  // Base packages for a minimal system
  base: [
    'jsonnet',
  ],
  // Important packages for building other packages
  // Necessary for native developer.
  devel: [
    'gcc',
    'clang',
    'make',
    'cmake',
    'cpio',
    'meson',
    'ccache',
    'aria2',
    'axel',
    'python-beautifulsoup4',
    'nodejs',
    'rustup',
    'lldb',
    'go',
    'bun',
    'deno',
  ],
  package_managers: [
    'snapd',
    'flatpak',
  ],
  fonts: [
    'nerd-fonts',
    'nerd-fonts-complete-mono-glyphs',
    'ttf-geist',
    'ttf-geist-mono',
    'otf-geist',
    'otf-geist-mono',
    'otf-monaspace',
    'ttf-monaspace-variable',
    'ttf-jetbrains-mono',
    'ttf-inter',
    // https://github.com/slavfox/Cozette
    'cozette-ttf',
    // https://github.com/nerdypepper/scientifica
    // 'curie-font',
    // 'ttf-scientifica',
    // 'scientifica-font',
    // https://github.com/SolidZORO/zpix-pixel-font
    'ttf-zpix',
    'ttf-miracode',
    // fantasque-sans
    'otf-fantasque-sans-mono',
    'ttf-fantasque-sans-mono',
  ],
  desktop_environment: [
    'swww',
    'waypaper',
    'waybar',
    'qt5-wayland',
    'qt6-wayland',
    'polkit-kde-agent',
  ],
  terminal_emulators: [
    'kitty',
  ],
  shell: [
    'zsh',
    'fish',
    'nushell',
    // Utilities for shell
    'fzf',
    'ripgrep',
    'bat',
    'fd',
    'exa',
    'procs',
    'dust',
    'tokei',
    'hyperfine',
    'sd',
    'starship',
    'zoxide',
    'atuin',
    // Python Packages
    'python-numpy',
    'python-matplotlib',
    'python-scipy',
    'bash-preexec',
    'dprint',
    // 'biome',
    'turbo',
    'yadm',
    'mise',
  ],
  security: [
    'pass',
    'libsecret',
    'ydotool',
    'wl-clipboard',
    'keybase',
    'protonvpn',
    'gnome-keyring',
    'seahorse',
  ],
  software: [
    // File Managers
    'nautilus',
    // Web Browsers
    'floorp',
    'tor-browser',
    'github-cli',
    '1password',
    // Music
    'spotify',
    // Communication
    'slack-desktop',
    'telegram-desktop',
    'signal-desktop',
    'discord',
    // Notes
    'heynote',
    'obsidian',
    // ...
    'parabolic',
    'lact',  // For iGPU Management
    'bauh',
    // Developer Tools
    // 'zed-editor',
    'jetbrains-toolbox',
    'github-desktop-bin',
    'helix',
    // Helix Addons
    'bash-language-server',
    'clang',
    'dart',
    'gopls',
    'julia',
    'lua-language-server',
    'python-lsp-server',
    'rust-analyzer',
    'taplo',
    'typescript-language-server',
    'zls',
    // Python Tooling
    'rye',
    'uv',
    // Developer Utilities
    'just',
    '1password-cli',
    'gitbutler-bin',
    'hoppscotch-app-bin',
    'hydroxide',
    'mailspring',
    'evince',
  ],
  // TODO: Docker
  // TODO: Virtualization
  // TODO: VPN
  // TODO: Network Tools
  // TODO: Multimedia
  // TODO: Office
  // TODO: System Administration
  sysadmin: [
    'cockpit',
    'cockpit-zfs-manager',
  ],
}
