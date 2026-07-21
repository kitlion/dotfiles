# My favorite alias

#alias ..='cd ..'
alias a='alias'
alias c='clear'
alias hc='history -c'
alias l='clear; ls -la --color'
alias o='ssh'
alias cron='vim /var/spool/cron/root'
alias reload='service httpd reload && service smb restart && service ungit restart'
alias rl='reload'
alias s='grep -r '

# Application alias
alias v='less'
alias vi='vim'
alias pf='vi ~/.zshrc'
alias pfb='vi ~/.bashrc'
alias rlpf='source ~/.zshrc; echo "Reloaded .zshrc"'

# Goto
alias ch='cd /etc/httpd/vhosts'
alias ch2='cd /etc/httpd/vhosts2'
alias vh='cd /var/www/vhosts'
alias vh2='cd /var/www/vhosts2'
alias html='cd /var/www/html'
alias mdo='cd ~/docker/'

# Quick functions
alias cba-ssl='~/cba-ssl'
alias remote='~/remote'
alias vhosts='~/vhosts'
alias mrs='rsync -avzP'
alias mrss='rsync -avzP --exclude={"node_modules","vendor"}'
alias mdns='networksetup -setnetworkserviceenabled Ethernet off; networksetup -setnetworkserviceenabled Ethernet on'
mdu() { if [[ $@ == "" ]]; then du -sh ./*; else du -sh $@; fi }
mdot() { rsync -avz --progress /data/vhosts/my-dotfiles/ ~/.dotfiles/ && source ~/.zshrc; }

# Git alias
# checks for any files flagged w/ --skip-worktree alias
alias check="git ls-files -v | grep '^S'"
# add --skip-worktree flag to file
skip() {  git update-index --skip-worktree "$@";  git status; }
# remove --skip-worktree flag from file
unskip() {  git update-index --no-skip-worktree "$@";  git status; }

# Docker makefile alias
alias dss='docker ps --format "table {{.Names}}\t{{.Status}}"'
mssh() { cd ~/docker/ && if [[ $@ == "" ]]; then make bash; else make bash n="$@"; fi }
mgssh() { if [[ $@ == "" ]]; then echo "Please specify CONTAINER ID"; else make gbash n="$@"; fi }
mreup() { cd ~/docker/ && if [[ $@ == "" ]]; then make reup; else make reup n="$@"; fi }
mdown() { cd ~/docker/ && if [[ $@ == "" ]]; then make down; else make down n="$@"; fi }
mls() {
  docker ps --format "table {{.ID}} : {{.Names}}\t{{.Status}}\t{{.Ports}}"
}

alias dot-update="~/.dotfiles/bootstrap.sh true && source ~/.zshrc"
alias dot-menu="~/.dotfiles/bootstrap.sh"
alias dot-uninstall="~/.dotfiles/uninstall.sh"
#alias debug="echo 1"

alias php-clear="php artisan config:clear && php artisan cache:clear"
