#!/usr/bin/ruby
# coding: utf-8

dotfiles = [
  '.gitconfig',
  '.gitignore',
  '.gvimrc',
  '.pryrc',
  '.vimrc',
  '.zsh.d',
  '.zshenv',
  '.zshrc',
  '.vim',
  '.tmux.conf',
#  '.config'
]

dir = File.dirname(File.expand_path(__FILE__))
dotfiles.each do |f|
  begin
    src = File.join(dir, f)
    dst = File.join(ENV['HOME'], f)
    File.unlink dst if FileTest::symlink? dst
    File.symlink(src, dst)
  rescue => e
    $stderr.puts e
    exit 1
  end
end

vscode_jsons = [
  'settings.json',
  'keybindings.json'
]

dir = File.join(File.dirname(File.expand_path(__FILE__)),'vscode')
vscode_jsons.each do |f|
  begin
    src = File.join(dir, f)
    dst = File.join(ENV['HOME'], 'Library/Application Support/Code/User', f)
    File.unlink dst if FileTest::symlink? dst
    File.symlink(src, dst)
  rescue => e
    $stderr.puts e
    exit 1
  end
end

# install vim-plug
`mkdir -pv ~/.vim/autoload/`
`curl -fLo ~/.vim/autoload/plug.vim  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
