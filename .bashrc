# abort unless running interactively.
[[ $- != *i* ]] && return

# don't log common commands.
export HISTIGNORE="&:ls:la:exit"
export HISTSIZE=10000
shopt -s histappend

# don't echo control characters.
stty -echoctl

# Disable START/STOP output control. (The OSX terminal sends XON/XOFF for Ctrl+Q
# and Ctrl+S (respectively), which is not only confusing and utterly useless,
# but prevents Bash's forward history search (also Ctrl+S) from working.)
stty -ixon -ixoff

# include dotfiles in globs.
shopt -s dotglob

# Source a file if it exists. Otherwise do nothing.
try_source () {
  if [ -f "$1" ]; then
    source "$1"
  fi
}

# ------------------------------------------------------------------------------

function git_token {
  git_ref=$(git symbolic-ref HEAD 2>/dev/null)
  if [ $? -ne 0 ]; then
    # Probably not in a git repo
    return
  fi

  git_head=$(git rev-parse --short HEAD 2>/dev/null)
  echo "${git_ref##refs/heads/}" "$git_head"
}

function venv_token {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    local n
    n=$(basename "$VIRTUAL_ENV")

    # If the virtualenv is in a dir called 'venv', that's not very useful to
    # display, so use the parent directory instead.
    if [[ "$n" == "venv" ]]; then
      n=$(basename "$(dirname "$VIRTUAL_ENV")")
    fi

    echo "$n"
  fi
}

function prompt_tokens {
  for name in "$@"; do
    text=$("$name""_token")

    if [[ -n $text ]]; then
      echo -n "[$name $text] "
    fi
  done
}

# adammck@bender (git:master) (rvm:1.9.2@gemset)
# ~/projects/whatever$
PS1='\n\u@\h $(prompt_tokens git venv)\n\w$ '

# disable the virtualenv prompt prefix, since my $PS1 (above) provides it.
export VIRTUAL_ENV_DISABLE_PROMPT=1

# ------------------------------------------------------------------------------

# define git aliases.
alias gs='git status'
alias ga='git add --all'
alias gd='git diff --color'
alias gds='gd --staged'
alias gdo='gd origin/$(git_branch) $(git_branch)'
alias gc='git commit -v'
alias gca='ga :/ && gc'
alias gl='git log --color -p'
alias gm='git merge --no-commit --no-ff'
alias gr='cd ./$(git rev-parse --show-cdup)'

# Define other aliases.
alias la='ls -lah'
alias ku='kubectx -u'

# deletes all branches already merged into the current branch.
function git_cleanup {
  git branch --merged | grep -v "\*" | xargs -n 1 git branch -d
}

# colorize ls output
export CLICOLOR=1

# Disable the Homebrew beer mug
export HOMEBREW_NO_EMOJI=1

# include host-specific config (if available) for aliases and hacks.
try_source "$HOME/.bashrc.$(hostname)"

# Initialize autojump, if installed (with Homebrew). This needs to be in here,
# rather than in .profile, because it isn't inherited by nested shells.
if [ -s "/usr/local/etc/autojump.sh" ]; then
  . "/usr/local/etc/autojump.sh"
fi

# Same for M1.
if [ -f /opt/homebrew/etc/profile.d/autojump.sh ]; then
  . /opt/homebrew/etc/profile.d/autojump.sh
fi
