# Path to your oh-my-zsh installation.
export ZSH=/Users/smohamed/.oh-my-zsh

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

ZSH_THEME="arrow"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(zsh-autosuggestions git brew vim pip)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin"

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Adding proper locale problem
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# An alias to suspend/lock the screen
alias lockscreen='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'

# for docker reasons
eval "$(docker-machine env default)"


# Activating tmux
if [ "$TMUX" = "" ]; then tmux; fi
