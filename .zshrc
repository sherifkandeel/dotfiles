# Path to your oh-my-zsh installation.
export ZSH=/Users/s.mohamed/.oh-my-zsh

# copy theme if it doesn't exist 
cp -n ~/mydotfiles/sherif.zsh-theme ~/.oh-my-zsh/themes/sherif.zsh-theme

ZSH_THEME=sherif

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(zsh-autosuggestions git brew pip)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin"

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# ssh
export SSH_KEY_PATH="~/.ssh/dsa_id"

# Adding proper locale problem
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# An alias to suspend/lock the screen
alias lockscreen='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'

# For tmux powerline
# PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

# Activating tmux
if [ "$TMUX" = "" ]; then tmux; fi
eval "$(rbenv init -)"

#jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Use fd and fzf to get the args to a command.
# Works only with zsh
# Examples:
# f mv # To move files. You can write the destination after selecting the files.
# f 'echo Selected:'
# f 'echo Selected music:' --extention mp3
# fm rm # To rm files in current directory
# alias f='fd . '/' | fzf'
f() {
    sels=( "${(@f)$(fd . '/' | fzf)}" )
    test -n "$sels" && print -z -- "$1${sels[@]:q:q}"
}

fh() {
    sels=( "${(@fh)$(fd "${fd_default[@]}" "${@:2}"| fzf)}" )
    test -n "$sels" && print -z -- "$1${sels[@]:q:q}"
}

# Like f, but not recursive.
fm() fh "$@" --max-depth 1

# Deps
alias fz="fzf-noempty --bind 'tab:toggle,shift-tab:toggle+beginning-of-line+kill-line,ctrl-j:toggle+beginning-of-line+kill-line,ctrl-t:top' --color=light -1 -m"
fzf-noempty () {
	local in="$(</dev/stdin)"
	test -z "$in" && (
		exit 130
	) || {
		ec "$in" | fzf "$@"
	}
}
ec () {
	if [[ -n $ZSH_VERSION ]]
	then
		print -r -- "$@"
	else
		echo -E -- "$@"
	fi
}

fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/[^ ]* //' | sed 's/[^ ]* //')
}

# fkill - kill processes - list only the ones you can kill. Modified the earlier script.
fkill() {
    local pid 
    if [ "$UID" != "0" ]; then
        pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    fi  

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi  
}

# check folder if the cd exists for this first: git@github.com:changyuheng/zsh-interactive-cd.git
source ~/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh
#------------------------------------------------------------------------------------

#onelogin
export ONELOGIN_USERNAME=sherif.mohamed@deliveryhero.com
alias onelogin_login=$HOME/dh/logistics-infra-tools/Security-Login/assume_role_onelogin.sh

#proteus
export PROTEUS_ROOT=~/dh/logistics-infra-terraform

#k8s
alias kubectl-prod-ap="kubectl --kubeconfig $HOME/.kube_tool/production-ap"
alias kubectl-prod-eu="kubectl --kubeconfig $HOME/.kube_tool/production-eu"
alias kubectl-prod-us="kubectl --kubeconfig $HOME/.kube_tool/production-us"
alias kubectl-st="kubectl --kubeconfig $HOME/.kube_tool/staging"
alias kubectl-qa="kubectl --kubeconfig $HOME/.kube_tool/qa"
alias kbap="kubectl --kubeconfig $HOME/.kube_tool/production-ap"
alias kbeu="kubectl --kubeconfig $HOME/.kube_tool/production-eu"
alias kbus="kubectl --kubeconfig $HOME/.kube_tool/production-us"
alias kbst="kubectl --kubeconfig $HOME/.kube_tool/staging"
alias kbqa="kubectl --kubeconfig $HOME/.kube_tool/qa"
alias kblt="kubectl --kubeconfig $HOME/.kube_tool/load-tests"
function kub-pod-exec-cmd()
{
  local kub_config=$1
  local app=$2
  local country=$3
  local cmd=$4
  printf $4
  kubectl --kubeconfig=$kub_config exec -ti `kubectl --kubeconfig=$kub_config get pod -l app=$app,country=$country -o=custom-columns=NAME:.metadata.name --no-headers | head -n1` $cmd
}


#sbt with java8
alias sbt8="sbt -java-home /Library/Java/JavaVirtualMachines/jdk1.8.0_201.jdk/Contents/Home"
export PATH="$HOME/.rbenv/bin:$PATH"


#2FAs
alias onelogin_2fa='oathtool --totp -b RWAUV33LPY2CWPJ3P4ENGVTMSFTPQQET | pbcopy'
alias onelogin_print_2fa='oathtool --totp -b RWAUV33LPY2CWPJ3P4ENGVTMSFTPQQET'
alias pwdd='echo "Gz5%K^OrJsYukVDkyY&MFfNgsk3v\n`onelogin_print_2fa`"'
# alias onelogin='echo "44mF4vzD@&Lv^dgk&U8r*u\$mZuaI\n`onelogin_print_2fa`" | onelogin_login'
alias onelogin='pwdd | onelogin_login'


#GITHUB token 
# export GITHUB_TOKEN=f0f91214c216397a9e8d5d48b9921e0a878b0d45
export GITHUB_TOKEN=c34c753fd99e4e0ee41e877c7d27e95979ffef86

#JAVA_HOME
export JAVA_HOME=$(/usr/libexec/java_home)

# first-tab() {
#     if [[ $#BUFFER == 0 ]]; then
#         BUFFER="cd "
#         CURSOR=3
#         zle list-choices
#     else
#         zle expand-or-complete
#     fi
# }
# zle -N first-tab
# bindkey '^I' first-tab

#status bar function
function get_current_branch() {
    git rev-parse --abbrev-ref HEAD
}


#scala 
export PATH="/usr/local/opt/sbt@0.13/bin:$PATH"
export PATH="/usr/local/opt/scala@2.12/bin:$PATH"
