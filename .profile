# shellcheck shell=bash

add_path () {
  if [ -d "$1" ]; then
    export PATH="$1:$PATH"
  fi
}

# Initialize rbenv
if [ -z "${RBENV_SHELL++}" ]; then
  if which rbenv >/dev/null 2>&1; then
    eval "$(rbenv init -)";
  fi
fi

# Initialize pyenv
if [ -z "${PYENV_SHELL++}" ]; then
  if which pyenv >/dev/null 2>&1; then
    eval "$(pyenv init -)";
  fi
fi

# Add GOPATH/bin to PATH, for tools which are installed via go get.
if which go >/dev/null 2>&1; then
  export PATH="$PATH:$(go env GOPATH)/bin"
fi

# Set up the perl5 bin, if this machine has one. The package manager (cpanm)
# seems to want to install things here, which the system perl can't find.
if [ -d "$HOME/perl5" ]; then
  export PERL5LIB=$HOME/perl5/lib/perl5
  export PATH="$PATH:$HOME/perl5/bin"
fi

# Initialize the Google Cloud SDK
if [ -d "$HOME/.google/google-cloud-sdk" ]; then
  . "$HOME/.google/google-cloud-sdk/completion.bash.inc"
  . "$HOME/.google/google-cloud-sdk/path.bash.inc"
fi

# Add user bins last
add_path "$HOME/.dotfiles/bin"
add_path "$HOME/bin"

# Show login banner, if one exists
if [ -s "$HOME/.banner" ]; then
  cat "$HOME/.banner"
fi

. "$HOME/.bashrc"
