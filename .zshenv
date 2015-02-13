source ~/.zsh.d/zshenv

PATH=/Applications/MacVim.app/Contents/MacOS:~/bin:/usr/local/bin:$PATH

# rmしたらゴミ箱行き
alias rm='rmtrash'

if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

# rabbit
export DYLD_LIBRARY_PATH=/usr/local/opt/cairo/lib
