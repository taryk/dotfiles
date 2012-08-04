### {{
# PERL

# perlbrew
alias pbi='perlbrew install'
alias pbl='perlbrew list'
alias pbo='perlbrew off'
alias pbs='perlbrew switch'
alias pbu='perlbrew use'
alias pbu='perlbrew available'

export PERLBREW_ROOT=/opt/perl5
export PERLBREW_PATH=/opt/perl5/bin:/home/taryk/perl5/perlbrew/bin

# imports perlbrew function
source /opt/perl5/etc/bashrc

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
  # set $EDITOR to 'emacs' if it is undefinned
  # [[ -z $EDITOR ]] && EDITOR=emacs 

  # if the file exists, just open it
  [[ -e $1 ]] && print "$1 exists; not modifying.\n" && emacsclient.emacs24 -nw $1

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
### }}
