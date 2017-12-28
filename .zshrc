export DEFAULT_USER="nauden"
export GOPATH="${HOME}/go"
export PATH="${PATH}:${GOPATH}/bin"
export XKB_DEFAULT_LAYOUT=no

alias dgit='git --git-dir ~/.dotfiles/.git --work-tree=$HOME'

source ${HOME}/.config/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle golang
antigen bundle git
# antigen theme agnoster

antigen theme simple

antigen apply
