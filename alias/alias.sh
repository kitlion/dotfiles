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
alias rlz='source ~/.zshrc; echo "Reloaded .zshrc."'
alias rlb='source ~/.bashrc; echo "Reloaded .bashrc."'

# Goto
alias gdf='cd ~/.dotfiles'
alias gdk='cd ~/docker'
alias ch='cd /etc/httpd/vhosts'
alias ch2='cd /etc/httpd/vhosts2'
alias vh='cd /var/www/vhosts'
alias vh2='cd /var/www/vhosts2'
alias mdo='cd ~/docker/'
alias mvh='cd ~/vhosts/'
alias mdf='df -h'
alias mf='free -m'

# Quick functions
alias msm="bash ~/my-shell/server-maintenance.sh"
alias mdns='networksetup -setnetworkserviceenabled Ethernet off; networksetup -setnetworkserviceenabled Ethernet on'
mdu() { if [[ $@ == "" ]]; then du -sh ./*; else du -sh $@; fi }

# Git alias
# checks for any files flagged w/ --skip-worktree alias
alias check="git ls-files -v | grep '^S'"
# add --skip-worktree flag to file
skip() {  git update-index --skip-worktree "$@";  git status; }
# remove --skip-worktree flag from file
unskip() {  git update-index --no-skip-worktree "$@";  git status; }

# Docker makefile alias
alias dst='docker stats'
alias dss='docker ps --format "table {{.ID}} : {{.Names}}\t{{.Status}}"'
alias dssp='docker ps --format "table {{.Names}}\t{{.Ports}}"'
dlog() { if [[ $@ == "" ]]; then echo "Please specify CONTAINER ID | CONTAINER NAME"; else docker logs -f "$@"; fi }
mssh() { cd ~/docker/ && if [[ $@ == "" ]]; then make bash; else make bash n="$@"; fi }
mgssh() { if [[ $@ == "" ]]; then echo "Please specify CONTAINER ID | CONTAINER NAME"; else docker exec -it "$@" bash; fi }
mgsh() { if [[ $@ == "" ]]; then echo "Please specify CONTAINER ID | CONTAINER NAME"; else docker exec -it "$@" sh; fi }
mreup() { cd ~/docker/ && if [[ $@ == "" ]]; then make reup; else make reup n="$@"; fi }
mdown() { cd ~/docker/ && if [[ $@ == "" ]]; then make down; else make down n="$@"; fi }
mrs() { cd ~/docker/ && if [[ $@ == "" ]]; then echo "Please specify CONTAINER ID | CONTAINER NAME"; else make rs n="$@"; fi }
mclean() {
	if [[ $@ == "" ]]; then
		echo "Dry-run: the following files would be deleted:"
		find . -regextype posix-extended \
			-type f -regex '.*/(\._.*|\.~.*|\~\$.*|\.DS_Store|Thumbs\.db|.*\.tmp)$' \
			-print
	else
		find . -regextype posix-extended \
			-type f -regex '.*/(\._.*|\.~.*|\~\$.*|\.DS_Store|Thumbs\.db|.*\.tmp)$' \
			-delete -print
		echo "Cleaned up temporary and unwanted files."
	fi
}

alias dot-update="~/.dotfiles/bootstrap.sh true && source ~/.zshrc"
alias dot-menu="~/.dotfiles/bootstrap.sh"
alias dot-uninstall="~/.dotfiles/uninstall.sh"
#alias debug="echo 1"

alias php-clear="php artisan config:clear && php artisan cache:clear"
