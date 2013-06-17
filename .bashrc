# abort unless running interactively.
[[ $- != *i* ]] && return

# don't log common commands.
export HISTIGNORE="&:ls:la:exit"
export HISTSIZE=10000
shopt -s histappend

# don't echo control characters.
stty -echoctl

# include dotfiles in globs.
shopt -s dotglob

# ----------------------------------------------------------------- Yesterday --

__midnight() {
  echo "00:00:00"
}

__today () {
  date "+%Y/%m/%d"
}

__previous_weekday () {
  wday=$(date "+%u")
  [ $wday = 1 ] && o=3 || o=1
  date -v -${o}d "+%Y/%m/%d"
}

__git_dirs () {
  find $HOME/projects -type d -name .git -maxdepth 2
}

__yesterday_log () {
  if [[ -n $(ls $1/refs/heads 2>/dev/null) ]]; then
    repo_name=$(basename $(dirname $1))

    git\
      --git-dir=$1\
    log\
      --all\
      --pretty="format:%C(yellow)%h%Creset %C(bold black)$repo_name%Creset %s"\
      --since="$(__previous_weekday) $(__midnight)" --until="$(__today) $(__midnight)"\
      --author="$(git config --get user.name)"
  fi
}

yesterday () {
  for git_dir in $(__git_dirs); do
    __yesterday_log $git_dir
  done
}

# ------------------------------------------------------------------------------

function git_branch {
  ref=$(git symbolic-ref HEAD 2>/dev/null)
  echo ${ref##refs/heads/}
}

function git_token {
  echo $(git_branch)
}

function rbenv_token {
  if [[ -n $(which rbenv 2>/dev/null) ]]; then
    version=$(rbenv version-name 2>/dev/null)

    if [[ $version != "system" ]]; then
      echo -n $version
    fi
  fi

  if [[ -n $(which rbenv-gemset 2>/dev/null) ]]; then
    gemset=$(rbenv-gemset active 2>/dev/null)

    if [[ -n $gemset ]]; then
      echo -n "@$gemset"
    fi
  fi
}

function venv_token {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    basename "$VIRTUAL_ENV"
  fi
}

function prompt_tokens {
  for name in "$@"; do
    text=$($name"_token")

    if [[ -n $text ]]; then
      echo -n "[$name:$text] "
    fi
  done
}

# adammck@bender (git:master) (rvm:1.9.2@gemset)
# ~/projects/whatever$
PS1='\[\e[1;30m\]\n\u@\h $(prompt_tokens git rbenv venv)\n\[\e[0;37m\]\w$ \[\e[0m\]'

# disable the virtualenv prompt prefix, since my $PS1 (above) provides it.
export VIRTUAL_ENV_DISABLE_PROMPT=1

# print a horizontal rule, to make an obvious divider.
function hr {
  div=$(seq -f "-" -s "" $(tput cols))
  echo -en '\033[1;30m'"\n$div\n"'\033[0m'
}

# Generate a secure password.
function pw {
  pwgen -s -1 32
}

# define git aliases.
alias gs='git status'
alias ga='git add'
alias gd='git diff --color'
alias gds='gd --staged'
alias gdo='gd origin/$(git_branch) $(git_branch)'
alias gc='git commit -v'
alias gca='ga -A && gc'
alias gl='git log --color -p'
alias gm='git merge --no-commit --no-ff'

# colorize ls output
if [[ $OSTYPE == darwin* ]]; then
  alias ls='ls -G'

elif [[ $OSTYPE == linux* ]]; then
  alias ls='ls --color=auto'
fi

# define other aliases.
alias la='ls -la'
alias be='bundle exec'

# include local config (if available) for aliases and hacks.
if [[ -s "$HOME/.bashrc.local" ]]; then
  source "$HOME/.bashrc.local"
fi
