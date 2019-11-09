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

if [[ -x `which exa &> /dev/null` ]]; then
  alias ls='exa --time-style=long-iso'
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

####################
export PATH=$PATH:~/bin

# golang
if [ -d "/usr/local/go" ]; then
  export GOPATH=~/go
  export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin
fi

bindkey '^]' peco-src

function peco-src() {
	local src=$(ghq list --full-path|peco --query "$LBUFFER")
	if [ -n "$src" ]; then
		BUFFER="cd $src"
		zle accept-line
	fi
	zle -R -c
}
zle -N peco-src

# rbenv
if [[ -x `which rbenv &> /dev/null` ]]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# pyenv
PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
  export PATH=${PYENV_ROOT}/bin:$PATH
  eval "$(pyenv init -)"
fi

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH
export DYLD_LIBRARY_PATH=/usr/local/opt/cairo/lib

# nodenv
if [[ -x `which nodeenv &> /dev/null` ]]; then
  eval "$(nodenv init -)"
fi

# direnv
if which direnv > /dev/null 2>&1 ; then
  eval "$(direnv hook zsh)"
fi

# rust
if [ -d "$HOME/.cargo" ]; then
  source $HOME/.cargo/env
fi

# less
export LESS='--no-init --RAW-CONTROL --LONG-PROMPT'

# gcloud
export PATH="$PATH:$HOME/google-cloud-sdk/bin"

# gcc
export PATH="/usr/local/opt/avr-gcc@7/bin:$PATH"

# dotnet
export PATH="$PATH:/usr/local/share/dotnet:$HOME/.dotnet/tools"
