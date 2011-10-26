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

# adammck@host:~/dir
PS1='\u@\h:\w$ '

function git_branch {
    b=$(git symbolic-ref HEAD 2>/dev/null)
    b=${b##refs/heads/}
    echo $b
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
