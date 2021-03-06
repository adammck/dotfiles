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
  if [ -f $1 ]; then
    source $1
  fi
}

# ------------------------------------------------------------------------------

function git_branch {
  ref=$(git symbolic-ref HEAD 2>/dev/null)
  echo ${ref##refs/heads/}
}

function git_head {
  git rev-parse --short HEAD 2>/dev/null
}

function git_token {
  echo $(git_branch) $(git_head)
}

function venv_token {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    local n=$(basename "$VIRTUAL_ENV")

    # If the virtualenv is in a dir called 'venv', that's not very useful to
    # display, so use the parent directory instead.
    if [[ "$n" == "venv" ]]; then
      n=$(basename $(dirname "$VIRTUAL_ENV"))
    fi

    echo $n
  fi
}

function aws_okta_token {
  if [[ -n "$AWS_OKTA_PROFILE" ]]; then
    echo -ne "\033[41m" # bg=red
    echo -ne "\033[97m" # fg=white
    echo -n "$AWS_OKTA_PROFILE"
    echo -ne "\033[0m" # reset
  fi
}

# todo: this is very slow, make it faster
function kube_token {
  # file is not cleared when no active context :'(
  #local ctx=$(cat $HOME/.kube/kubectx 2>/dev/null)
  local ctx=$(kubectx -c 2>/dev/null | tr -d '\n')

  # no token if no active context
  # (use `kubectx -u` to unset context)
  if [[ -z $ctx ]]; then
    return
  fi

  # white-on-red for prod clusters, otherwise normal
  if [[ "$ctx" == *"prod.dog" ]]; then
    echo -ne "\033[41m" # bg=red
    echo -ne "\033[97m" # fg=white
  fi

  echo -n $ctx

  if [[ "$ctx" == *"prod.dog" ]]; then
    echo -ne "\033[0m" # reset
  fi

  echo -n " "

  #cat $HOME/.kube/kubens/$ctx 2>/dev/null
  kubens -c 2>/dev/null | tr -d '\n'
}

function prompt_tokens {
  for name in "$@"; do
    text=$($name"_token")

    if [[ -n $text ]]; then
      echo -n "[$name $text] "
    fi
  done
}

# adammck@bender (git:master) (rvm:1.9.2@gemset)
# ~/projects/whatever$
PS1='\n\u@\h $(prompt_tokens git venv aws_okta kube)\n\w$ '

# disable the virtualenv prompt prefix, since my $PS1 (above) provides it.
export VIRTUAL_ENV_DISABLE_PROMPT=1

# ------------------------------------------------------------------------------

# Search DuckDuckGo
# The query is prefixed with a bang, to avoid having to escape it.
function ddg {
  if [ -n "$1" ]; then
    escaped=$(echo \!$@ | perl -lpe 's/([^A-Za-z0-9])/sprintf("%%%02X", ord($1))/seg')
    open "https://duckduckgo.com/?q=$escaped"
  else
    open "https://duckduckgo.com/bang.html"
  fi
}

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
alias gpr='git pull --rebase origin $(git_branch)'

# Define other aliases.
alias la='ls -lah'
alias ku='kubectx -u'

# deletes all branches already merged into the current branch.
function git_cleanup {
  git branch --merged | grep -v "\*" | xargs -n 1 git branch -d
}

# colorize ls output
export CLICOLOR=1

# Disable the idiotic Homebrew beer mug
export HOMEBREW_NO_EMOJI=1

# include host-specific config (if available) for aliases and hacks.
try_source "$HOME/.bashrc.$(hostname)"

# Initialize autojump, if installed (with Homebrew). This needs to be in here,
# rather than in .profile, because it isn't inherited by nested shells.
if [ -s "/usr/local/etc/autojump.sh" ]; then
  . "/usr/local/etc/autojump.sh"
fi

# Initialize pyenv
if which pyenv >/dev/null 2>&1; then
  eval "`pyenv init -`";
fi
