export ZSH="${HOME}/.oh-my-zsh"

# Theme.
ZSH_THEME="spaceship"
export SPACESHIP_DIR_TRUNC=0

# Plugins.
plugins=(git)

alias ls='exa'
alias ll='exa -l'
alias la='exa -la'
alias l='exa -l'
alias l1='exa -1'
alias cat='bat'
alias c='bat'
alias du='dust'
alias grep='rg'
alias head='coreutils head'

source $ZSH/oh-my-zsh.sh

# Set colors for LS_COLORS.
eval `dircolors ~/.dircolors`
