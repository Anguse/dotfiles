# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin:/usr/include:~/.cargo/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib:/usr/lib:/usr/include

export TERMINAL="alacritty"

# Path to your oh-my-zsh installation.
export ZSH="/home/hdla/.oh-my-zsh"

# Prevas
export PREV_ROOT="/home/hdla/Development/prevas"
export PREV_VPN_USER="$PREV_ROOT/vpn/vpn-user"

# Strongpoint
export SP_ROOT="/home/hdla/Development/strongpoint"
export SP_VPN_PASSWD="$SP_ROOT/vpn/vpn-passwd"
export SP_VPN_USER="$SP_ROOT/vpn/vpn-user"
export SP_SSH_PASSWD="$SP_ROOT/ssh/ssh-passwd"
export SP_GITLAB_TOKEN="$SP_ROOT/gitlab/api/token"

# lcov
# export GCOV_PREFIX="/strongpoint/gcda"
# export GCOV_PREFIX_STRIP=8

export TERM=screen-256color
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git fzf)

source $ZSH/oh-my-zsh.sh

# User configuration
#
# Swap caps-lock and escape
setxkbmap -option caps:swapescape

# Increase input rate when holding down a key
xset r rate 300 50 

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vi'
 else
   export EDITOR='nvim'
 fi

# fasd init
eval "$(fasd --init auto)"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#alias rm='echo "This is not the command you are looking for."; false'
alias vpn-prevas='sudo openconnect --user=$(cat $PREV_VPN_USER) --authgroup=2-PrevasUser https://vpn.prevas.se'
alias vpn-strongpoint='cat $SP_VPN_PASSWD | sudo openconnect --user=$(cat $SP_VPN_USER) --passwd-on-stdin --protocol=gp gp.strongpoint.com'
alias vpn-strongpoint-slice='cat $SP_VPN_PASSWD | sudo openconnect --user=$(cat $SP_VPN_USER) --passwd-on-stdin --protocol=gp gp.strongpoint.com -m 1290 --script 'vpn-slice 172.18.31.80/8''
alias ssh-unico='sshpass -f $SP_SSH_PASSWD ssh unico'

# Functions
scp-target()
{
    file=`fzf --header="Select file" | sed 's/\n//'`
    hosts=`grep -P "^Host ([^*]+)$" $HOME/.ssh/config | sed 's/Host //'`
    host=`printf $hosts | fzf --header="Select target"`
    directory=`sshpass -f $SP_SSH_PASSWD ssh -t $host "cd / && fd --type directory --color never" | fzf --header="Select target directory"`
	sshpass -f $SP_SSH_PASSWD scp $file $host:/$directory
}
scp-from-target()
{
    hosts=`grep -P "^Host ([^*]+)$" $HOME/.ssh/config | sed 's/Host //'`
    host=`printf $hosts | fzf`
    file=`sshpass -f $SP_SSH_PASSWD ssh -t $host "find / -type f" | fzf --header="Select file"`
	sshpass -f $SP_SSH_PASSWD scp $host:/$file .
}
tail-target()
{
    hosts=`grep -P "^Host ([^*]+)$" $HOME/.ssh/config | sed 's/Host //'`
    host=`printf $hosts | fzf`
    file=`sshpass -f $SP_SSH_PASSWD ssh -t $host "cd /strongpoint/log/current && fd -e log --color never" | fzf --header="Select log"`
    echo "Enter tail query: "
    read query
	sshpass -f $SP_SSH_PASSWD ssh -t $host "tail -n 3 -f /strongpoint/log/current/$file | grep $query"
}
docking-station-init()
{
    interface=`printf "DP-1\nDP-2-3" | fzf --header="Select display interface"`
    resolution=`printf "1920x1080\n4196x2160" | fzf --header="Select display resolution"`
    rate=`printf "30\n60" | fzf --header="Select display rate"`
    # xrandr --output $interface --auto
    xrandr --output $interface --mode $resolution --rate $rate --same-as eDP-1
}
docking-station-destroy()
{
    interface=`printf "DP-1\nDP-2-3" | fzf --header="Select display interface"`
    xrandr --output $interface --off
    xrandr --output eDP-1 --auto
}
redmine-fetch()
{
    export PYTHONWARNINGS="ignore:Unverified HTTPS request"
    python3 $SP_ROOT/redmine/redmine-fetch.py
    unset PYTHONWARNINGS
}

# Load mtime at bash start-up
# echo "zshrc mtime: $(stat -f ~/.zshrc)" >&2
export ZSHRC_MTIME=$(stat -c '%y' ~/.zshrc)

PROMPT_COMMAND="check_and_reload_zshrc"
check_and_reload_zshrc () {

    if [ "$(stat -c '%y' ~/.zshrc)" != $ZSHRC_MTIME ]; then
        export ZSHRC_MTIME="$(stat -f ~/.zshrc)"
        echo "zshrc changed. re-sourcing..."
        . ~/.zshrc
    fi
}
precmd() { eval "$PROMPT_COMMAND" }

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/hdla/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/hdla/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/hdla/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/hdla/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# autocomplete
eval "$(register-python-argcomplete conda)"
# <<< conda initialize <<<

# cht.sh autocompletion
fpath=(~/.zsh.d/ $fpath)
export FZF_BASE=/usr/bin/fzf
export BASHMATIC_HOME="/home/hdla/.bashmatic"
[[ -f ${BASHMATIC_HOME}/init.sh ]] && source ${BASHMATIC_HOME}/init.sh
export PATH="${PATH}:${BASHMATIC_HOME}/bin"
