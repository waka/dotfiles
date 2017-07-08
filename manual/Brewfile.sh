#!/bin/sh

#
# Install Homebrew
#   ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
#
# Let's install softwares!
#   ./Brewfile.sh
#

# Make sure using latest Homebrew
brew update || true

# Update already-installed formula
brew upgrade || true

# Add Repository
brew tap homebrew/binary || true
brew tap caskroom/cask || true
brew tap tkengo/highway || true
brew tap neovim/neovim || true

# Packages for develop
brew install fish || true
brew install git || true
brew install tig || true
brew install neovim || true
brew install tmux || true
brew install highway || true
brew install fzf || true

# Packages for ruby
brew install openssl || true
brew install readline || true

# .dmg from brew-cask
brew cask install google-chrome || true
brew cask install google-drive || true
brew cask install iterm2 || true
brew cask install virtualbox || true
brew cask install karabiner || true
brew cask install macvim || true
brew cask install alfred || true
brew cask install kindle || true

# Remove outdated versions
brew cleanup
brew cask cleanup
