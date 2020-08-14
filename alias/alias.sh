# My favorite alias

alias top='top -M'
#alias ..='cd ..'
alias a='alias'
alias c='clear'
alias e='exit'
alias hc='history -c'
alias l='clear; ls -la --color'
alias o='ssh'

# Application alias
alias v='less'
alias vi='vim'
alias via='vim ~/my-alias/alias.sh'
alias pf='vi ~/.zshrc'
alias pfb='vi ~/.bashrc'
alias rlb='. ~/.bashrc; echo ".bashrc reloaded!"'

# Goto
alias ch='cd /etc/httpd/vhosts'
alias vh='cd /var/www/vhosts'
alias html='cd /var/www/html'

# Quick functions
alias remote='~/change_git_remote'
alias vhosts='~/vhosts.bash'

# checks for any files flagged w/ --skip-worktree alias
alias check="git ls-files -v | grep '^S'"
# add --skip-worktree flag to file
skip() {  git update-index --skip-worktree "$@";  git status; }
# remove --skip-worktree flag from file
unskip() {  git update-index --no-skip-worktree "$@";  git status; }


alias dot-update="~/.dotfiles/bootstrap.sh true"
#alias debug="echo 1"
