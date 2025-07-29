if status is-interactive
    # Commands to run in interactive sessions can go here
end

# use vi-mode
fish_vi_key_bindings

# PATH
set -x PATH /opt/homebrew/bin $PATH
set -x PATH ~/bin $PATH

set -x EDITOR vim

# anyenv
status --is-interactive; and source (anyenv init -|psub)

# direnv
eval (direnv hook fish)

alias rm="trash"

# kubectl plugin
set -gx PATH $PATH $HOME/.krew/bin
