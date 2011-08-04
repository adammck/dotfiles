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

# define git aliases.
alias gs='git status'
alias ga='git add'
alias gd='git diff --color'
alias gds='gd --staged'
alias gc='git commit -v'
alias gl='git log --color -p'
alias gm='git merge --no-commit --no-ff'

# define other aliases.
alias ls='ls --color=auto'
alias la='ls -la'
