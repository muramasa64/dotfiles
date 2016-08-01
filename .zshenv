source ~/.zsh.d/zshenv

PATH=/Applications/MacVim.app/Contents/MacOS:~/bin:/usr/local/bin:$PATH:$SUDO_PATH

if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

# for rabbit
export DYLD_LIBRARY_PATH=/usr/local/opt/cairo/lib
