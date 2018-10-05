defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 1
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write com.apple.HIToolbox AppleEnabledInputSources -array-add '<dict><key>InputSourceKind</key><string>Keyboard Layout</string><key>KeyboardLayout ID</key><integer>15000</integer><key>KeyboardLayout Name</key><string>Arabic-PC</string></dict>'

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

brew bundle install 

cp .gitconfig ~/.gitconfig
cp .gitignore_global ~/.gitignore_global
cp .ideavimrc ~/.ideavimrc
cp .tmux.conf ~/.tmux.conf
cp .vimrc ~/.vimrc
cp .zshrc ~/.zshrc
