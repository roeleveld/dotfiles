#!/bin/sh

echo "Setting up your Mac..."

echo "Check for Homebrew and install if we don't have it"
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Update Homebrew recipes"
brew update

echo "Install all our dependencies with bundle (See Brewfile)"
brew tap homebrew/bundle
brew bundle

echo "Link Cask Apps to Alfred"
brew cask alfred link

echo "homebrew cleanup"
brew cleanup --force
rm -f -r /Library/Caches/Homebrew/*

echo "Make ZSH the default shell environment"
chsh -s $(which zsh)

echo "Install global NPM packages"
npm install --global yarn

echo "Install other stuff"
pip install glances
gem install rails

echo "Create a Projects directory for git repos"
# This is a default directory for macOS user accounts but doesn't comes pre-installed
mkdir $HOME/Projects

echo "Set macOS preferences"
# We will run this last because this will reload the shell
source .macos