#!/bin/sh

# ruby
if [ ! -d "$HOME/.rbenv" ]; then
  echo "install rbenv, ruby-build, ruby-2.1.0"
  git clone https://github.com/sstephenson/rbenv.git $HOME/.rbenv
  git clone https://github.com/sstephenson/ruby-build.git $HOME/.rbenv/plugins/ruby-build
  CONFIGURE_OPTS="--with-readline-dir=`brew --prefix readline` --with-openssl-dir=`brew --prefix openssl` --with-gcc=clang" rbenv install 2.1.2

  source $HOME/.zshrc

  rbenv global 2.1.2
  rbenv rehash
  gem install bundler
  rbenv rehash
fi

# node.js
if [ ! -d "$HOME/.nodebrew" ]; then
  curl -L git.io/nodebrew | perl - setup

  source $HOME/.zshrc

  nodebrew install-binary latest
  nodebrew use latest
fi

# mysql
# https://gist.github.com/waka/8448846
