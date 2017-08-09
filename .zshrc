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

# 環境に合わせて出来るだけ好みのls出力にする
if ls -N ~ >/dev/null 2>&1; then
  # 最近の gnubin/ls が勝手にファイル名をクオート出力してくるのを抑止
  alias ls='ls --color --time-style +%Y-%m-%d\ %H:%M:%S.%3N -N'
elif ls --time-style +%Y-%m-%d\ %H:%M:%S.%3N ~ >/dev/null 2>&1; then
  # デフォの時間表示は見難いのでISOぽくする(full-iso,long-iso,isoは帯に短し襷に長しなのでカスタム)
  alias ls='ls --color --time-style +%Y-%m-%d\ %H:%M:%S.%3N'
elif ls --color ~ >/dev/null 2>&1; then
  # せめて色だけでも…
  alias ls='ls --color'
fi

########################################
# OS 別の設定
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        #alias ls='ls -G -F'
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

# golang
export GOPATH=~/go
export PATH=$PATH:/$GOPATH/bin:/usr/local/opt/go/libexec/bin

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH
