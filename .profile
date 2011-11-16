# add my bin to $PATH.
if [[ -d "$HOME/bin" ]]; then
  PATH="$HOME/bin:$PATH"
fi

# add the perl bin to $PATH, for ack (etc).
if [[ -d /usr/bin/perlbin/site ]]; then
  PATH="$PATH:/usr/bin/perlbin/site"
fi

# execute bashrc.
if [[ -s "$HOME/.bashrc" ]]; then
  . "$HOME/.bashrc"
fi

# show login banner.
if [[ -s "$HOME/.banner" ]]; then
  cat "$HOME/.banner"
fi
