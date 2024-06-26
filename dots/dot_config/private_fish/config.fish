if status is-interactive
    # Commands to run in interactive sessions can go here
    zoxide init fish | source
    atuin init fish | source
end

# proto
set -gx PROTO_HOME "$HOME/.proto"
set -gx PATH "$PROTO_HOME/shims:$PROTO_HOME/bin" $PATH
# go
set -gx GOBIN "$HOME/.go/bin"
set -gx PATH "$GOBIN" $PATH
# pnpm
set -gx PNPM_HOME "/home/keinsell/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

set -Ux CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense'
mkdir -p ~/.config/fish/completions
carapace --list | awk '{print $1}' | xargs -I{} touch ~/.config/fish/completions/{}.fish
carapace _carapace | source
