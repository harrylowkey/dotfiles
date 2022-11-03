# Path to your oh-my-zsh installation.
export ZSH="/Users/hongquang/.oh-my-zsh"

# Theme
ZSH_THEME="robbyrussell"

# Update ZSH interval
UPDATE_ZSH_DAYS=13

# Load plugins
plugins=(git zsh-autosuggestions aliases)

# Bootstrap
source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH=${PATH}:/usr/local/mysql/bin/ export PATH="/opt/homebrew/opt/mysql@5.7/bin:$PATH"
export PATH=$HOME/bin:/opt/homebrew/bin:/usr/local/bin:$PATH
export PATH="/opt/homebrew/opt/mysql@5.7/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
path+=("$HOME/.local/bin")
export PATH

export GITLAB_DIGINEX_TOKEN=xb2kuSuksaUMyLN58213
export CI_JOB_TOKEN=xb2kuSuksaUMyLN58213
setopt auto_cd

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh


export PATH="$PATH:/Users/hongquang/Dev/flutter/bin"
export ANDROID_HOME=/Applications/ADT/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Alias for kubectl
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

# Load fzf lib
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Config thefuck alias
eval $(thefuck --alias)

# Load zsh
source $ZSH/oh-my-zsh.sh
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
