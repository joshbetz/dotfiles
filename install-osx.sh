#!/bin/bash

# Get current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Install homebrew
which brew > /dev/null || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew upgrade
for package in $(cat $DIR/brewlist); do
	if ! brew ls --version $package > /dev/null; then
		brew install $package
	fi
done
for cask in $(cat $DIR/casklist); do
	if ! brew cask ls --versions $cask > /dev/null; then
		brew cask install $cask
	fi
done

# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Enable subpixel font rendering on non-Apple LCDs
defaults write NSGlobalDomain AppleFontSmoothing -int 2

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Disable shadow on screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# Set Dock size
defaults write com.apple.dock tilesize -int 32

# Require password after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -bool true
defaults write com.apple.screensaver askForPasswordDelay 5

# Show battery percentage in menu bar
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Show the full URL in the address bar
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Enable “Do Not Track”
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

killall Finder
killall Dock
