#!/bin/bash

# Get current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Install homebrew
which brew > /dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
if [[ "$(arch)" == "arm64" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    eval "$(/usr/local/bin/brew shellenv)"
fi
brew update
brew upgrade
brew cleanup
brew bundle --file=$DIR/Brewfile

# Download apps that aren't in the app store
curl -so ~/Downloads/hyperkey.dmg https://hyperkey.app/downloads/Hyperkey0.22.dmg
curl -so ~/Downloads/quitter.zip https://marco.org/appcasts/Quitter.zip

# Set background color
wallpaper set-solid-color 292C33
wallpaper set "${DIR}/apple.png" --scale center

# Show menu bar in full screen
defaults write NSGlobalDomain AppleMenuBarVisibleInFullscreen -int 1

# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Show path bar in Finder
defaults write com.apple.finder ShowPathbar -bool true

# Always search within folder
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Enable subpixel font rendering on non-Apple LCDs
defaults write NSGlobalDomain AppleFontSmoothing -int 2

# Avoid creating .DS_Store files on network and USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Disable shadow on screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# Set Dock size
defaults write com.apple.dock tilesize -int 32

# Hide recent apps in Dock
defaults write com.apple.dock "show-recents" -bool "false"

# Require password after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -bool true
defaults write com.apple.screensaver askForPasswordDelay 5

# Show the full URL in the address bar
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Enable “Do Not Track”
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

# Expand save & print dialogs by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true && \
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true && \
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true && \
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Disable auto capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Remove items from trash after 30 days
defaults write com.apple.finder FXRemoveOldTrashItems -bool true

# Turn on app auto-update
defaults write com.apple.commerce AutoUpdate -bool true

killall Finder
killall Dock

# Add iOS & watch simulator to Applications
ln -sf "/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app" "/Applications/Simulator.app"
ln -sf "/Applications/Xcode.app/Contents/Developer/Applications/Simulator (Watch).app" "/Applications/Simulator (Watch).app"
