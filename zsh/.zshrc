# If you come from bash you might have to change your $PATH.
export PATH=$PATH:$HOME/.local/bin

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
export TERM=screen-256color

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="arrow"

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
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
#
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
alias docker="sudo docker"
alias docker-compose="sudo docker-compose"

# Functions
scp-target()
{
    file=`fzf --header="Select file" | sed 's/\n//'`
    hosts=`grep -P "^Host ([^*]+)$" $HOME/.ssh/config | sed 's/Host //'`
    host=`printf $hosts | fzf --header="Select target"`
    directory=`ssh -t $host "cd / && find -type d" | fzf --header="Select target directory"`
	scp $file $host:/$directory
}
scp-from-target()
{
    hosts=`grep -P "^Host ([^*]+)$" $HOME/.ssh/config | sed 's/Host //'`
    host=`printf $hosts | fzf`
    file=`ssh -t $host "find / -type f" | fzf --header="Select file"`
	scp $host:/$file .
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
open-ssh-hosts()
{
    nmap -p 22 --open -sV $SP_KISTA_SUBNET/24 -oG - | awk '/Up$/{print $2}'
}
ssh-syscon-target()
{
    # ssh-hosts=`open-ssh-hosts`
    target=`open-ssh-hosts | fzf`
	sshpass -f $SP_SSH_PASSWD ssh root@$target
    # interface=`printf "DP-1\nDP-2-3" | fzf --header="Select display interface"`
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

# Do something like this to source different zshrc files based on profile?
# https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout
[[ -f "${ZSH_DIR}/profiles/${ZSH_PROFILE}.rc.zsh" ]] &&
    source "${ZSH_DIR}/profiles/${ZSH_PROFILE}.rc.zsh"
