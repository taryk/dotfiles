# ~/.zshrc - ZSH initial script
#
# Author: Taras Yagniuk <truestyler@gmail.com>
# Version: 0.1
# keywords: zsh shell emacs perl

export HISTFILE=~/.zhistory
export HISTSIZE=1000000
export SAVEHIST=1000000
export HISTTIMEFORMAT="%Y-%m-%d %H:%I:%S %T "
#eval `dircolors -b`

setopt extendedhistory

autoload -U compinit
compinit -C

# colorized
autoload -U colors && colors

# hosts=(192.168.1.1
#        192.168.1.2
#        192.168.1.5)
# zstyle '*' hosts $hosts

zstyle ':completion:*' menu yes select
zstyle ':completion:*:processes' command 'ps xua'
zstyle ':completion:*:processes' sort false
zstyle ':completion:*:processes-names' command 'ps xho command'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    eval `dircolors`
    alias ls='ls --color=auto'
    export GREP_OPTIONS='--color=auto'
    export GREP_COLOR='1;32'
fi

#
# RabbitMQ
#
export MQHOST='localhost'

# export http_proxy='http://192.168.0.1:8080/'
# export ftp_proxy='http://192.168.0.1:8080/'

if [ -f /usr/bin/grc ]; then
    
  alias grca="grc --colour=auto"

  for c in ping traceroute make diff last cvs netstat ifconfig uptime vmstat iostat df mount uname ps route lsmod whereis ; do
    alias ${c}="grca ${c}"
  done

  alias ll="grca ls --color=force -l"
  alias ccal="grca cal"

fi

autoload promptinit
promptinit
# prompt zefram

#
# Shell Job completed to remind
# for urxvt:
# URxvt.urgentOnBell: True
# for bash:
# export PROMPT_COMMAND="echo -ne '\a'"
# for zsh:
precmd () (
    echo -ne '\a'
)

case $TERM in
  xterm*|rxvt*)
    
    #
    # PS1 - The value of this parameter is expanded and used as the primary prompt string. The default value is \s-\v\$ .
    #
    export PS1="%{$fg[blue]%}%n%{$reset_color%}%\@%{$bg[red]%}%m%{$reset_color%} %{$fg[yellow]%}(%T)%{$reset_color%} %{$fg[magenta]%}%\{ %{$reset_color%}%~%{$fg[magenta]%} %\}%{$reset_color%}%{$fg[green]%}%#%{$reset_color%} "

    #
    # PS2 - The value of this parameter is expanded as with PS1 and used as the secondary prompt string. The default is >
    # 
    # export PS2=

    #
    # PS3 - The value of this parameter is used as the prompt for the select command
    #
    # export PS3=

    #
    # PS4 - The value of this parameter is expanded as with PS1 and the value is printed before each command bash displays during an execution trace. 
    # The first character of PS4 is replicated multiple times, as necessary, to indicate multiple levels of indirection. The default is +
    #
    # export PS4=
    export TERM=xterm-256color
    ;;

  # It is helpful to know when you're in screen.
  screen)
    #precmd () { print -Pn "\033k%~\033\\" }
    #preexec () { print -Pn "\033k$1\033\\" }
    export PS1="[screen] %{$fg[blue]%}%n%{$reset_color%}%\@%{$fg[red]%}%m%{$reset_color%} %{$fg[yellow]%}(%T)%{$reset_color%} %{$fg[magenta]%}%\{ %{$reset_color%}%~%{$fg[magenta]%} %\}%{$reset_color%}%{$fg[green]%}%#%{$reset_color%} "
    ;;

  # linux tty
  linux)
    export PS1="[%l] %{$fg[blue]%}%n%{$reset_color%}%\@%{$bg[red]%}%m%{$reset_color%} %{$fg[yellow]%}(%T)%{$reset_color%} %{$fg[magenta]%}%\{ %{$reset_color%}%~%{$fg[magenta]%} %\}%{$reset_color%}%{$fg[green]%}%#%{$reset_color%} "
    ;;

  # emacs terminals
  emacs*|eterm*)
    export PS1="[emacs] %n@%m { %~ } %# "
  
#  eterm-color)
#    export PS1="[emacs] %{$fg[blue]%}%n%{$reset_color%}%\@%{$bg[red]%}%m%{$reset_color%} %{$fg[yellow]%}(%T)%{$reset_color%} %{$fg[magenta]%}%\{ %{$reset_color%}%~%{$fg[magenta]%} %\}%{$reset_color%}%{$fg[green]%}%#%{$reset_color%} "    
esac

#
# Emacs Tramp hangs every time you try to connect.
# preexec and precmd call also be noxious if they do fancy stuff
#
if [[ "$TERM" == "dumb" ]]; then
  unsetopt zle
  unsetopt prompt_cr
  unsetopt prompt_subst
  unfunction precmd
  unfunction preexec
  PS1='$ '
fi

#
# Puts ~/bin to PATH if exists
#
if [ -d ~/bin ] ; then
  PATH=~/bin:"${PATH}"
fi

#
# Apache Debry (JavaDB)
#
# if [ -d /usr/lib/jvm/java-6-sun-1.6.0.20/db/bin/ ] ; then
#    PATH="${PATH}":/usr/lib/jvm/java-6-sun-1.6.0.20/db/bin/
# fi
# export DERBY_HOME="/usr/lib/jvm/java-6-sun-1.6.0.20/db/"
# export CLASSPATH=.:${DERBY_HOME}/lib/derby.jar
#

#
# PostgreSQL 9
#
if [ -d /usr/lib/postgresql/9.1/bin/ ]; then
    PATH="${PATH}":/usr/lib/postgresql/9.1/bin/
fi

export GTK2_RC_FILES="/home/taryk/.gtkrc"

setopt autocd
setopt extended_glob
setopt correct

# 
# Aliases
#

alias sdr="screen -aAdr"
alias la="ls -A"
alias ll="ls -lA"
alias grep='grep --exclude="*.svn*"'
alias sudos="sudo -s"
alias mkpasswd="head -c5 /dev/urandom | xxd -ps"
alias mkpath='mkdir -p'
alias ..='cd ..'
alias cd..='cd ..'
alias sshx='ssh -X'
alias cache_drop='sudo sh -c "echo 1 > /proc/sys/vm/drop_caches"'
alias cache_drop_2='sudo sh -c "echo 2 > /proc/sys/vm/drop_caches"'
alias cache_drop_3='sudo sh -c "echo 3 > /proc/sys/vm/drop_caches"'

alias new_login_in_window='gdmflexiserver --xnest'
alias new_login='gdmflexiserver'

alias netbeans_gtk='/usr/local/netbeans/bin/netbeans --laf GTK'
alias z='ps -Af | grep'

# for awesome wm test
alias awetest="Xephyr -ac -br -noreset -screen 800x600 :1 & sleep 1 && DISPLAY=:1.0 awesome -c ~/.config/awesome/rc.lua"

# source local zshalias
if [ -e ~/.zshalias.local ]; then
  source ~/.zshalias.local
fi

#
# User funcs
#

fix_mp3() { 
    find -iname '*.mp3' -print0 | xargs -0 mid3iconv -eCP1251 --remove-v1 
}

mpg2flv() { 
    ffmpeg -i $1 -ar 22050 -ab 32 -f flv -s 320x240 `echo $1 | awk -F . '{print $1}'`.flv 
}

mcd() { 
    mkdir $1; cd $1 
}

svn_ignore() {
    svn propedit svn:ignore .
}

# bindkey -s history-search-forward

# newday() { mcd `date +%F` }
# c() { awk "{ print \$$1 }" }
# svnid() { svn propset svn:keywords "Author Date Id Revision" $1 }

#
# PERL
#

# perlbrew ########
alias pbi='perlbrew install'
alias pbl='perlbrew list'
alias pbo='perlbrew off'
alias pbs='perlbrew switch'
alias pbu='perlbrew use'

export PERLBREW_ROOT=/opt/perl5
export PERLBREW_PATH=/opt/perl5/bin:/home/taryk/perl5/perlbrew/bin

############ Perl ############

# perldoc
alias pd='perldoc'

# use perl like awk/sed
alias ple='perl -wlne'

# latest stable perl version
latest-perl() {
    curl -s http://www.perl.org/get.html | perl -wlne 'if (/perl\-([\d\.]+)\.tar\.gz/) { print $1; exit;}'
}

# newpl - creates a basic Perl script file and opens it with `emacs -nw`
newpl () {
  # set $EDITOR to 'vim' if it is undefinned
  # [[ -z $EDITOR ]] && EDITOR=emacs 

  # if the file exists, just open it
  [[ -e $1 ]] && print "$1 exists; not modifying.\n" && emacs -nw $1

  # if it doesn't, make it, and open it
  [[ ! -e $1 ]] && print '#!/usr/bin/perl'"\n"'use strict;'"\n"'use warnings;'\
          "\n\n" > $1 && emacs -nw $1
}

# pgs - Perl Global Substitution
# find pattern          = 1st arg
# replace pattern       = 2nd arg
# filename              = 3rd arg
pgs() { # [find] [replace] [filename]
  perl -i.orig -pe 's/'"$1"'/'"$2"'/g' "$3"
}


# Perl grep, because 'grep -P' is terrible. Lets you work with pipes or files.
prep() { # [pattern] [filename unless STDOUT]
  perl -nle 'print if /'"$1"'/;' $2
}

# say - append a newline to 'print'
say() {
  print "$1\n"
}

# perlbrew

source /opt/perl5/etc/bashrc

# fucking great advice 
# echo -e `curl -s  http://fucking-great-advice.ru/api/random | awk -F \" '{print $8}'` |sed 's/\&nbsp;/ /g'
