#!/bin/sh

#
# Install Homebrew
#   ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
#
# Set brew-cask options
#   export HOMEBREW_CASK_OPTS="--appdir=/Applications --caskroom=/usr/local/Caskroom"
#
# Let's install softwares!
#   brew bundle
#

export HOMEBREW_CASK_OPTS="--appdir=/Applications --caskroom=/usr/local/Caskroom"

# Make sure using latest Homebrew
brew update || true

# Update already-installed formula
brew upgrade || true

# Add Repository
#tap homebrew/versions || true
brew tap homebrew/binary || true
brew tap caskroom/cask || true

# Packages for develop
brew install zsh || true
brew install git || true
brew install tig || true
brew install vim || true

# Packages for ruby
brew install openssl || true
brew install readline || true

# Packages for brew-cask
brew install brew-cask || true

# .dmg from brew-cask
brew cask install google-chrome || true
brew cask install iterm2 || true
brew cask install virtualbox || true
brew cask install vagrant || true
brew cask install karabiner || true
brew cask install hipchat || true
brew cask install macvim || true
brew cask install alfred || true

# Remove outdated versions
brew cleanup
