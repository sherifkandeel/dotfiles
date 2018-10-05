defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 1
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write com.apple.HIToolbox AppleEnabledInputSources -array-add '<dict><key>InputSourceKind</key><string>Keyboard Layout</string><key>KeyboardLayout ID</key><integer>15000</integer><key>KeyboardLayout Name</key><string>Arabic-PC</string></dict>'
defaults write -g TISRomanSwitchState -bool true
defaults write com.apple.dock tilesize -int 38
defaults write com.apple.dock autohide -bool true
defaults write AppleEnableSwipeNavigateWithScrolls -bool true
defaults -currentHost write com.apple.screensaver idleTime -int 0
defaults write com.apple.dashboard mcx-disabled -bool true

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

brew bundle install 

cp .gitconfig ~/.gitconfig
cp .gitignore_global ~/.gitignore_global
cp .ideavimrc ~/.ideavimrc
cp .tmux.conf ~/.tmux.conf
cp .vimrc ~/.vimrc
cp .zshrc ~/.zshrc
