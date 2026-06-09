#! /bin/bash
if [ ! -e "$HOME/Library/LaunchAgents" ]; then
  mkdir ~/Library/LaunchAgents
fi
cd "$HOME/Library/LaunchAgents" || exit 1
curl -LO https://github.com/JMR-dev/mac_util_scripts/raw/refs/heads/main/LaunchAgents/com.user.homebrew-update.plist
curl -LO https://github.com/JMR-dev/mac_util_scripts/raw/refs/heads/main/LaunchAgents/com.user.restart-browsers.plist
curl -LO https://github.com/JMR-dev/mac_util_scripts/raw/refs/heads/main/LaunchAgents/update-nvim-config.plist
# Install Commands
launchctl bootstrap gui/"$(id -u)" com.user.homebrew-update.plist
launchctl bootstrap gui/"$(id -u)" com.user.restart-browsers.plist
launchctl bootstrap gui/"$(id -u)" com.user.update-nvim-config.plist

echo 'Automation agents installed'
