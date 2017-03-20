#!/bin/sh

# make symbolic links

for name in *; do
  target="$HOME/.$name"
  if [ -e "$target" ]; then
    if [ ! -L "$target" ]; then
      echo "WARNING: $target exists but is not a symlink."
    fi
  else
    if [ "$name" != 'install.sh' ] && [ "$name" != 'manual' ] && [ "$name" != 'README.md' ]; then
      echo "Creating $target"
      ln -s "$PWD/$name" "$target"
    fi
  fi
done

# for nvim

if [ ! -d $HOME/.config/nvim ]
then
  mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
  ln -s $HOME/.vim $XDG_CONFIG_HOME/nvim
  ln -s $HOME/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
fi

# install dein.vim

if [ ! -d $HOME/.cache/dein ]
then
  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > $HOME/.cache/dein/installer.sh
  sh $HOME/.cache/dein/installer.sh $HOME/.cache/dein
fi
