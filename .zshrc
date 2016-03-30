# Path to your oh-my-zsh installation.
export ZSH=/Users/smohamed/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"
ZSH_THEME="arrow"
# ZSH_THEME="remy"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git brew vim pip)

# User configuration

export PATH="/Users/smohamed/sre/sre-web/sre-venv-p3/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#---------------------------added by smohamed---------------------
#------------------------THEMES-------------------------
# ZSH_THEME="powerlevel9k/powerlevel9k"
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv dir)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vcs time)

# POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
# POWERLEVEL9K_SHORTEN_DELIMITER=""
# POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='250'
# POWERLEVEL9K_DIR_HOME_BACKGROUND='250'
# POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='250'

# POWERLEVEL9K_VIRTUALENV_BACKGROUND='cyan'
# POWERLEVEL9K_VIRTUALENV_FOREGROUND='255'

# POWERLEVEL9K_STATUS_VERBOSE=false

# POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\uE0B1'
# POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\uE0B3'

#Adding proper locale problem
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

#POWERLINE-STATUS
# export powerlineconfig=/usr/local/lib/python2.7/site-packages/powerline
#powerline daemon makes it much faster
# powerline-daemon -q
# POWERLINE_BASH_CONTINUATION=1
# POWERLINE_BASH_SELECT=1
# . /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

#sourcing the activate of autoenv library (a virtual env library for python projects)
source /usr/local/opt/autoenv/activate.sh

#an alias to suspend the machine basically lock the screen
alias lockscreen='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'

#activating the python3 virtualenv
alias venv3='source /Users/smohamed/sre/sre-web/sre-venv-p3/bin/activate'

#cding into the main project folder for zalando team and sourcing the venv3
#environment
alias sreweb='cd ~/sre/sre-web/sreweb-new/sreweb-new/; venv3'

#activating the python virutalenv
alias venv='source /Users/smohamed/sre/sre-web/sre-venv/bin/activate'

#for docker reasons
eval "$(docker-machine env default)"


#activating tmux
if [ "$TMUX" = "" ]; then tmux; fi
