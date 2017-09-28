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


export DISPLAY=:0.0
