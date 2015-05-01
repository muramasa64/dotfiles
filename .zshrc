source ~/.zsh.d/zshrc

# for ssh complete
function print_known_hosts () {
  if [ -f $HOME/.ssh/known_hosts ]; then
    cat $HOME/.ssh/known_hosts | tr ',' ' ' | cut -d' ' -f1
  fi
}
_cache_hosts=($( print_known_hosts ))

# color
autoload -Uz colors
colors

# colordiff
if [[ -x `which colordiff` ]]; then
  alias diff='colordiff -u'
else
  alias diff='diff -u'
fi

alias g='git'
alias gl='git l'
alias ga='git add'
alias gch='git checkout'
alias gc='git commit'
alias gcv='git commit -v'
alias gn='git now'
alias vi='vim'

########################################
# OS 別の設定
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        alias ls='ls -G -F'
        alias vim='Vim'
        alias rm='rmtrash'
        ;;
    linux*)
        #Linux用の設定
        ;;
esac

if [[ -e /usr/local/bin/aws_zsh_completer.sh ]]; then
    source /usr/local/bin/aws_zsh_completer.sh
fi

# golang
export GOPATH=~/.gocode

