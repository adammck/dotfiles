# abort unless running interactively.
[[ $- != *i* ]] && return

# initialize RVM, if it is installed.
if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
    source "$HOME/.rvm/scripts/rvm"
fi

# don't log common commands.
export HISTIGNORE="&:ls:la:exit"
export HISTSIZE=10000
shopt -s histappend

# don't echo control characters.
stty -echoctl

# include dotfiles in globs.
shopt -s dotglob

function git_branch {
  ref=$(git symbolic-ref HEAD 2>/dev/null)
  echo ${ref##refs/heads/}
}

function git_token {
  echo $(git_branch)
}

function rvm_token {
  if [[ -n $(which rvm-prompt 2>/dev/null) ]]; then
    rvm-prompt v g
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
PS1='\[\e[1;30m\]\n\u@\h $(prompt_tokens git rvm venv)\n\[\e[0;37m\]\w$ \[\e[0m\]'

# disable the virtualenv prompt prefix, since my $PS1 (above) provides it.
export VIRTUAL_ENV_DISABLE_PROMPT=1

# print a horizontal rule, to make an obvious divider.
function hr {
  div=$(seq -f "-" -s "" $(tput cols))
  echo -en '\033[1;30m'"\n$div\n"'\033[0m'
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

# fix arrow keys in vim under osx.
# i have no idea what the consequences of this are.
TERM=linux
