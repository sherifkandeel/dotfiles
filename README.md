# my dotfiles
my personalized dotfiles along with themes, new installation for mac.

## For a new Machine  
```bash
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1
defaults write -g ApplePressAndHoldEnabled -bool false

#Install iterm2

#Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#clone all repos 
curl -H "Authorization: token <token>" https://api.github.bus.zalan.do/orgs/<org>/repos\?per_page\=200 | grep clone_url | awk -F '"' '{print $4}' | xargs -n 1 -P 4 git clone
```



make sure to run this for .gitignore global
```
git config --global core.excludesfile ~/.gitignore_global
```
for tmux, you need to run this: 
```
brew install reattach-to-user-namespace
```

