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

source /usr/local/bin/aws_zsh_completer.sh
