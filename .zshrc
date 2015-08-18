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
if [[ -x `which colordiff &> /dev/null` ]]; then
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
alias gs='git status --short --branch'
alias gst='git status --long'
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

_homebrew-installed() {
  type brew &> /dev/null
}

_awscli-homebrew-installed() {
  brew --prefix awscli &> /dev/null
}

if _homebrew-installed && _awscli-homebrew-installed ; then
  source $(brew --prefix)/opt/awscli/libexec/bin/aws_zsh_completer.sh
else
  source `which aws_zsh_completer.sh` &> /dev/null
fi

# golang
export GOPATH=~/go
export PATH=$PATH:/$GOPATH/bin

