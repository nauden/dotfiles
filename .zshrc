alias dgit='git --git-dir ~/.dotfiles/.git --work-tree=$HOME'
alias dgst='dgit status'
alias dgl='dgit log'
alias dga='dgit add'
alias dgci='dgit commit'

alias open='xdg-open'
alias v='nvim'
alias vim='nvim'

export DEFAULT_USER="te"
export GOPATH="${HOME}/go"
export PATH="${PATH}:${HOME}/bin:${GOPATH}/bin:${HOME}/.npm-global/bin"
export XKB_DEFAULT_LAYOUT=no
export VISUAL=nvim
export EDITOR=${VISUAL}

source /usr/share/zsh/share/antigen.zsh

antigen use oh-my-zsh

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle golang
antigen bundle git
antigen bundle yarn

antigen theme simple

antigen apply
