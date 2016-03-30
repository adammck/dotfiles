. "$HOME/.bashrc"

add_path () {
  if [ -d $1 ]; then
    export PATH="$1:$PATH"
  fi
}

add_path "/usr/local/share/npm/bin"
add_path "/usr/local/heroku/bin"

# initialize rbenv and pyenv, if available
if which rbenv >/dev/null 2>&1; then eval "`rbenv init -`"; fi
if which pyenv >/dev/null 2>&1; then eval "`pyenv init -`"; fi

# Set the Go path
if [ -d "$HOME/code" ]; then
  export GOPATH="$HOME/code"
fi

# Add the Go bin to PATH
if [ -d "$GOPATH/bin" ]; then
  add_path "$GOPATH/bin"
fi

# Add ~/bin last, to prioritize it over other bins
add_path "$HOME/bin"

# show login banner, if one exists
# it's a handy place for machine-specific reminders
if [ -s "$HOME/.banner" ]; then
  cat "$HOME/.banner"
fi

# set the go path
if [ -d "$HOME/code" ]; then
  export GOPATH="$HOME/code"
fi
