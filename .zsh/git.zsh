### {{ GIT

function git_current_branch() {
  local ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo $( git_format_branch "${ref#refs/heads/}" )
}

git_format_branch() {
  [ -z $1 ] && return
  if [[ -n $(git status -s --ignore-submodules=dirty  2> /dev/null) ]]; then
    # echo " (%{${fg_lred}%}${1}%{${at_normal}%})"
    echo "%{$reset_color%} (%{$fg[red]%}${1}%{$reset_color%})"
  else
    # echo " (%{${fg_lgreen}%}${1}%{${at_normal}%})"
    echo "%{$reset_color%} (%{$fg[green]%}${1}%{$reset_color%})"
  fi
}

# export RPROMPT=$'$(git_current_branch) %*'
PROMPT_INSIDE=$'$(git_current_branch)'
setopt prompt_subst

### }}
