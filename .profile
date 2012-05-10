. "$HOME/.bashrc"

# add my user bin to $PATH.
if [[ -d "$HOME/bin" ]]; then
  export PATH="$HOME/bin:$PATH"
fi

# show login banner, if one exists.
# it's a handy place for machine-specific reminders.
if [[ -s "$HOME/.banner" ]]; then
  cat "$HOME/.banner"
fi
