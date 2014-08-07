. "$HOME/.bashrc"

add_path () {
  if [ -d $1 ]; then
    export PATH="$1:$PATH"
  fi
}

add_path "/usr/local/share/npm/bin"
add_path "/usr/local/heroku/bin"
add_path "/Applications/Postgres.app/Contents/MacOS/bin"

# initialize rbenv and pyenv, if available
if which rbenv >/dev/null 2>&1; then eval "$(rbenv init -)"; fi
if which pyenv >/dev/null 2>&1; then eval "$(pyenv init -)"; fi

# Add ~/bin last, to prioritize it over other bins
add_path "$HOME/bin"

# show login banner, if one exists
# it's a handy place for machine-specific reminders
if [[ -s "$HOME/.banner" ]]; then
  cat "$HOME/.banner"
fi

# set the go path
if [ -d "$HOME/code/go" ]; then
  export GOPATH="$HOME/code/go"
fi
