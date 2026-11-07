#!/bin/zsh

OS=$(uname -s)

case "$OS" in
    Darwin*)
        # macOS用の環境変数
        . "$HOMEBREW_REPOSITORY/opt/asdf/libexec/asdf.sh"
        . "$HOMEBREW_REPOSITORY/opt/antigen/share/antigen/antigen.zsh"
        ;;
    *)
        echo "Unsupported OS: $OS"
        ;;
esac

source ~/.zsh_aliases
source <(fzf --zsh)

# antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen apply

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

eval "$(starship init zsh)"

# bun completions
[ -s "/Users/mac/.bun/_bun" ] && source "/Users/mac/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
