if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
    source "$HOME/.rvm/scripts/rvm"
fi

# adammck@host:~/dir 
PS1='\u@\h:\w$ '

# git aliases
alias gs='git status'
alias ga='git add'
alias gd='git diff --color'
alias gds='gd --staged'
alias gc='git commit -v'
alias gl='git log --color -p'
alias gm='git merge --no-commit --no-ff'
