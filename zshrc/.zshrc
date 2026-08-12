# Path to your oh-my-zsh installation.
export ZSH="/Users/harrydang/.oh-my-zsh"

# Theme
ZSH_THEME="fino"

# Update ZSH interval
UPDATE_ZSH_DAYS=7

# Load plugins
plugins=(git zsh-autosuggestions aliases common-aliases zsh-fzf-history-search zsh-syntax-highlighting)

# Bootstrap
source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/opt/homebrew/opt/mysql@5.7/bin:$PATH"
export PATH="$HOME/bin:/opt/homebrew/bin:/usr/local/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
path+=("$HOME/.local/bin")
export PATH

setopt auto_cd

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Add flutter sdk
export PATH="$PATH:$HOME/flutter/bin"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator

# Load fzf lib
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# aliases of kubectl
alias k='kubectl'
alias ka='kubectl apply'
alias kc='kubectl create'
alias kd='kubectl delete'
alias kds='kubectl describe'
alias ked='kubectl edit'
alias kg='kubectl get'
alias kl='kubectl logs'
alias kubecns='kubectl config view | grep namespace'
alias kubecctx='kubectl config view | grep current-context:'

# aliases
alias lg='lazygit'

# nvim & tmux
alias mux=tmuxinator
alias nv=nvim
alias cl=clear

# change border color
borders active_color=0xff00ff00

# Password Store
export PASSWORD_STORE_ENABLE_EXTENSIONS=true
export PASSWORD_STORE_EXTENSIONS_DIR=/opt/homebrew/lib/password-store/extensions

# pnpm
export PNPM_HOME="/Users/harrydang/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun completions
[ -s "/Users/harrydang/.bun/_bun" ] && source "/Users/harrydang/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Drain pending terminal responses (fixes nvim DA1 leak in superset.sh)
function nvim() {
  command nvim "$@"
  # Wait for DA1 response then discard it
  sleep 0.1
  while read -t 0.01 -k 1 -s; do :; done
}

# Azure
export ARM_SUBSCRIPTION_ID=76bdb500-1100-46da-bc9f-3398d106698b

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/harrydang/.lmstudio/bin"
# End of LM Studio CLI section

# Secrets (API keys, tokens) — kept out of the tracked rc file
[ -f ~/.config/zshrc/.secrets.zsh ] && source ~/.config/zshrc/.secrets.zsh
