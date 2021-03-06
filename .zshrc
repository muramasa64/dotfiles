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

if [[ -x `which exa` ]]; then
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
        alias rm='trash'
        ;;
    linux*)
        #Linux用の設定
        ;;
esac

# homebrew
if [ -d "/opt/homebrew/bin" ]; then
  export PATH=/opt/homebrew/bin:$PATH
fi

_homebrew-installed() {
  type brew &> /dev/null
}

_awscli-homebrew-installed() {
  brew --prefix awscli &> /dev/null
}

####################
export PATH=$PATH:~/bin

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

# direnv
if which direnv > /dev/null 2>&1 ; then
  eval "$(direnv hook zsh)"
fi

if [ -d "/usr/local/Cellar/awscli/2.0.0/" ]; then
  source /usr/local/Cellar/awscli/2.0.0/share/zsh/site-functions/aws_zsh_completer.sh
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
export PATH="/usr/local/opt/avr-gcc/bin:$PATH"

# dotnet
export PATH="$PATH:/usr/local/share/dotnet:$HOME/.dotnet/tools"

# anyenv
if [ -d "$HOME/.anyenv" ]; then
  eval "$(anyenv init - zsh)"
fi

# golang
export GOPATH="${HOME}/go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"

