# Path to your oh-my-zsh installation.
export ZSH="/Users/harrydang/.oh-my-zsh"

# Theme
ZSH_THEME="robbyrussell"

# Update ZSH interval
UPDATE_ZSH_DAYS=7

# Load plugins
plugins=(git zsh-autosuggestions aliases common-aliases zsh-fzf-history-search zsh-syntax-highlighting)

# Bootstrap
source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
setopt auto_cd

#######################################

# EXPORT env

export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH=${PATH}:/usr/local/mysql/bin/
export PATH=$HOME/bin:/opt/homebrew/bin:/usr/local/bin:$PATH

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Add flutter sdk
export PATH="$PATH:$HOME/flutter/bin"
export ANDROID_HOME="$HOME/Library/Android/"
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Password Store
export PASSWORD_STORE_ENABLE_EXTENSIONS=true
export PASSWORD_STORE_EXTENSIONS_DIR=/opt/homebrew/lib/password-store/extensions

# ESG Gitlab Token
export GITLAB_DIGINEX_TOKEN=xb2kuSuksaUMyLN58213

#######################################

# ALIASES

# kubectl
alias k='kubectl'
alias ka='kubectl apply'
alias kc='kubectl create'
alias kD='kubectl delete'
alias kds='kubectl describe'
alias ked='kubectl edit'
alias kg='kubectl get'
alias kl='kubectl logs'
alias kubecns='kubectl config view | grep namespace'
alias kubecctx='kubectl config view | grep current-context:'

# layzygit
alias lg='lazygit'

# nvim & tmux
alias mux=tmuxinator
alias nv=nvim
alias cl=clear

# config k9s config folder location
export K9S_CONFIG_DIR=/Users/harrydang/.config/k9s

# disk used & sort with human readable
alias du="du -h | sort -h"

# s3 bucket
S3_PERSONAL_BUCKET=s3://harry-personal

# git cli
create_pr() {
  local base_branch="$1"
  local head_branch=$(git branch --show-current)
  gh pr create --base "$base_branch" --head "$head_branch"
}
alias mergeD-pr="gh pr merge -dm"
alias merge-pr="gh pr merge -m"

#######################################

# change border color
borders active_color=0xff00ff00

# python
alias python=python3
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi
