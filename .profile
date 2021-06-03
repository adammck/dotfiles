add_path () {
  if [ -d $1 ]; then
    export PATH="$1:$PATH"
  fi
}

# Initialize rbenv
if which rbenv >/dev/null 2>&1; then
  eval "`rbenv init -`";
fi

# Initialize pyenv
if which pyenv >/dev/null 2>&1; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "`pyenv init --path`"
fi

# Set the Go path
if [ -d "$HOME/code" ]; then
  export GOPATH="$HOME/code"
  add_path "$GOPATH/bin"
fi

# Initialize the Google Cloud SDK
if [ -d "$HOME/.google/google-cloud-sdk" ]; then
  source "$HOME/.google/google-cloud-sdk/completion.bash.inc"
  source "$HOME/.google/google-cloud-sdk/path.bash.inc"
fi

# Add user bins last
add_path "$HOME/.dotfiles/bin"
add_path "$HOME/bin"

# Show login banner, if one exists
if [ -s "$HOME/.banner" ]; then
  cat "$HOME/.banner"
fi

. "$HOME/.bashrc"
