### {{
# GRC

if [ -f /usr/bin/grc ]; then
    
  alias grca="grc --colour=auto"

  for c in ping traceroute make diff last cvs netstat ifconfig uptime vmstat iostat df mount uname ps route lsmod whereis ; do
    alias ${c}="grca ${c}"
  done

  alias ll="grca ls --color=force -lF"
  alias ccal="grca cal"

fi

### }}
