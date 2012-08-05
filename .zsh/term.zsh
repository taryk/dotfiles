### {{
# TERM

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

### }}
