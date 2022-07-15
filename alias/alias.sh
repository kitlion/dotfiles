# My favorite alias

#alias ..='cd ..'
alias a='alias'
alias c='clear'
alias hc='history -c'
alias l='clear; ls -la --color'
alias o='ssh'
alias cron='vim /var/spool/cron/root'
alias reload='service httpd reload && service smb restart'
alias s='grep -r '

# Application alias
alias v='less'
alias vi='vim'
alias pf='vi ~/.zshrc'
alias pfb='vi ~/.bashrc'
alias rlb='. ~/.bashrc; echo ".bashrc reloaded!"'

# Goto
alias ch='cd /etc/httpd/vhosts'
alias ch2='cd /etc/httpd/vhosts2'
alias vh='cd /var/www/vhosts'
alias vh2='cd /var/www/vhosts2'
alias html='cd /var/www/html'

# Quick functions
alias remote='~/remote'
alias vhosts='~/vhosts'

# checks for any files flagged w/ --skip-worktree alias
alias check="git ls-files -v | grep '^S'"
# add --skip-worktree flag to file
skip() {  git update-index --skip-worktree "$@";  git status; }
# remove --skip-worktree flag from file
unskip() {  git update-index --no-skip-worktree "$@";  git status; }


alias dot-update="~/.dotfiles/bootstrap.sh true"
alias dot-menu="~/.dotfiles/bootstrap.sh"
alias dot-uninstall="~/.dotfiles/uninstall.sh"
#alias debug="echo 1"

alias php-clear="php artisan config:clear && php artisan cache:clear"
