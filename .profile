. "$HOME/.bashrc"

# add the local (brew) sbin to $PATH.
if [[ -d "/usr/local/sbin" ]]; then
  export PATH="/usr/local/sbin:$PATH"
fi

# Add the NPM (node package manager) bin to $PATH.
if [[ -d "/usr/local/share/npm/bin" ]]; then
  export PATH="/usr/local/share/npm/bin:$PATH"
fi

# Add the Postgres.app bin to $PATH
if [[ -d "/Applications/Postgres.app/Contents/MacOS/bin" ]]; then
  export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"
fi

# initialize rbenv, if available.
if [[ -n $(which rbenv 2>/dev/null) ]]; then
  eval "$(rbenv init -)"
fi

# add my user bin to $PATH.
if [[ -d "$HOME/bin" ]]; then
  export PATH="$HOME/bin:$PATH"
fi

# show login banner, if one exists.
# it's a handy place for machine-specific reminders.
if [[ -s "$HOME/.banner" ]]; then
  cat "$HOME/.banner"
fi
