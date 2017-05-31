# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

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


#adding my config
PROMPT_COMMAND='history -a'

#add my alias

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

#move_to_trash () {
#	mv "$@"  ~/.mytrash
#}

#alias rm='move_to_tras'

#source /home/bookchan/db_project/bin/activate



alias notebook='cd ~/notebook/;nohup jupyter notebook --matplotlib=inline&'


export PYSPARK_DRIVER_PYTHON=/usr/local/bin/jupyter
export PYSPARK_DRIVER_PYTHON_OPTS="notebook --matplotlib=inline"
export PYSPARK_PYTHON=/usr/bin/python


export PATH=$PATH:$HOME/local/bin

export JAVA_HOME="/usr/lib/jvm/java-8-oracle/"

export HADOOP_HOME="/home/hadoop/hadoop/hadoop/"
export HADOOP_CONF_DIR="/home/hadoop/hadoop/config/pseudo_mode"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HADOOP_HOME/lib/native/

export C_INCLUDE_PATH=$C_INCLUDE_PATH:$HOME/local/include/



alias rm='rm -i'








#stanfor nlp setting
export STANFORD_HOME="$HOME/local/share/stanford_nlp"
export STANFORD_SEGMENTER_PATH="$STANFORD_HOME/segmenter"
export CLASSPATH="$CLASSPATH:$STANFORD_SEGMENTER_PATH/stanford-segmenter.jar:$STANFORD_SEGMENTER_PATH/slf4j-api.jar"


export STANFORD_POSTAGGER_PATH="$STANFORD_HOME/postagger"
export CLASSPATH="$CLASSPATH:$STANFORD_POSTAGGER_PATH/stanford-postagger.jar"

export STANFORD_NER_PATH="$STANFORD_HOME/ner"
export STANFORD_POSTAGGER_PATH="$STANFORD_HOME/postagger"
export CLASSPATH="$CLASSPATH:$STANFORD_NER_PATH/stanford-ner.jar:$STANFORD_POSTAGGER_PATH/stanford-postagger.jar"

export STANFORD_MODELS="$STANFORD_NER_PATH/classifiers:$STANFORD_POSTAGGER_PATH/models"


export CLASSPATH="$CLASSPATH:$STANFORD_POSTAGGER_PATH/stanford-postagger.jar"



export STANFORD_PARSER_PATH="$STANFORD_HOME/parser"
export CLASSPATH="$CLASSPATH:$STANFORD_PARSER_PATH/stanford-parser.jar:$STANFORD_PARSER_PATH/stanford-parser-3.7.0-models.jar"



cd $HOME/workspace/thesis




alias start_mongdb="mongod --dbpath $HOME/data/mongodb/db --port 27017 --logpath $HOME/data/mongodb/log --logappend &" 




