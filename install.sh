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

# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# brew bundle install 

# cp .gitconfig ~/.gitconfig
# cp .gitignore_global ~/.gitignore_global
# cp .ideavimrc ~/.ideavimrc
# cp .tmux.conf ~/.tmux.conf
# cp .vimrc ~/.vimrc
# cp .zshrc ~/.zshrc

# oh-my-zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

## you might need to run these commands separately as oh-my-zsh installation usually exits the script 

# autosuggestions plugin for zsh
# cd ~/.oh-my-zsh/custom/plugins
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# fonts for powerline
# cd ~/
# git clone https://github.com/powerline/fonts.git --depth=1
# cd fonts
# ./install.sh

# my custom powerline
# cd ~/
# git clone --branch personal https://github.com/sherifkandeel/tmux-powerline
