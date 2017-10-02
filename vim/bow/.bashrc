# Run twolfson/sexy-bash-prompt
. ~/.bash_prompt

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    [ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
    [ -e "$DIR_COLORS" ] || DIR_COLORS=""
    eval "`dircolors -b $DIR_COLORS`"
    alias ls='ls --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
fi



alias ls='ls --color'
alias lr='ranger --choosedir=$HOME/rangerdir;cd $(cat $HOME/rangerdir)'
alias ipy=ipython3

source /home/adas/setup/adas_setup.ksh


export DISPLAY='localhost:0.0'
export PATH=$PATH:/mnt/c/Windows/System32

export IDL_DIR=/usr/local/exelis/idl
