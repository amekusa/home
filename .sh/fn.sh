#  shell functions and aliases
# ----------------------------- *

. "$HOME/.sh/shlib/interactive.sh"


# ---- aliases ----

# cd
alias ..='cd ..'
alias ...='cd ../../'

# ls with options
alias ls='ls -pG'
alias ll='ls -hl'
alias la='ls -hal'

# run the previous command with sudo
alias plz='sudo $(fc -ln -1)'

# lazygit
alias lg='lazygit'

# fix micro + tmux conflicts
alias micro='TERM=xterm-256color micro'

# npm shortcuts
alias nrun='npm run'
alias nbuild='npm run build'
alias ntest='npm run test'
alias nwatch='npm run watch'

# start/stop server
alias start-server='brew services run mariadb; php-fpm -D; sudo nginx'
alias stop-server='brew services stop mariadb; killall php-fpm; sudo nginx -s stop'
