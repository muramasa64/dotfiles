source ~/.zsh.d/zshenv

PATH=/Applications/MacVim.app/Contents/MacOS:~/bin:/usr/local/bin:$PATH

if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

