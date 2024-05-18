# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac
# don't put duplicate lines or lines starting with space in the history. See bash(1) for more options
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=200
HISTFILESIZE=2000
# check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize
# If set, the pattern "**" used in a pathname expansion context will match all files and zero or more directories and subdirectories.
#shopt -s globstar
# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

__set_prompt() {
	PS1=''
	local bg1="235"
	local bg2="237"
	local bg3="240"
	local fg1="72"
	local fg2="75"
	local fg3="148"
	local stylestop="\[\e[0m\]"
	local style1="\[\e[48;5;$bg1;1;38;5;${fg1}m\]"
	local style2="\[\e[48;5;$bg2;1;38;5;${fg2}m\]"
	local style3="\[\e[48;5;$bg3;1;38;5;${fg3}m\]"
	local arrow1="\[\e[48;5;$bg2;38;5;${bg1}m\]"
	local arrow2="\[\e[48;5;$bg3;38;5;${bg2}m\]"
	local arrow3="\[\e[48;5;0;0;1;38;5;${bg3}m\]"
	PS1+="${style1}\u@\h${arrow1}${style2}\W${arrow2}${style3}\$${arrow3}${stylestop} "
}

PROMPT_COMMAND=__set_prompt
EDITOR=vim
VISUAL=vim
PAGER=less
LESSHISTSIZE=0
# Colors in less & man
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) # green
export LESS_TERMCAP_md=$(tput bold; tput setaf 6) # cyan
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4) # ye
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7) # white
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)
export LESS_TERMCAP_ZN=$(tput ssubm)
export LESS_TERMCAP_ZV=$(tput rsubm)
export LESS_TERMCAP_ZO=$(tput ssupm)
export LESS_TERMCAP_ZW=$(tput rsupm)
export GROFF_NO_SGR=1
export LESS="--RAW-CONTROL-CHARS"

export GOPATH=$HOME/Documents/go
export PATH=$PATH:$HOME/.local/bin:$HOME/Scripts:$HOME/.cargo/bin:$GOPATH/bin:$HOME/.local/share/gem/ruby/3.0.0/bin
export LIBVA_DRIVER_NAME=iHD
