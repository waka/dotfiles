#!/bin/sh

# fisher
if [ ! -d "$HOME/.rbenv" ]; then
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
  fisher z fzf decors/fish-ghq git_util
fi

# ruby
if [ ! -d "$HOME/.rbenv" ]; then
  echo "install rbenv, ruby-build"
  git clone https://github.com/sstephenson/rbenv.git $HOME/.rbenv
  git clone https://github.com/sstephenson/ruby-build.git $HOME/.rbenv/plugins/ruby-build
fi

# node.js
if [ ! -d "$HOME/.nodebrew" ]; then
  curl -L git.io/nodebrew | perl - setup
fi

