#  Bash Configuration
# -------------------- ---- -- -

# Shortcuts for ls with some options
alias ls='ls -G'
alias ll='ls -l'
alias la='ls -la'

# Run the previous command with sudo
alias plz='sudo $(fc -ln -1)'

# Open SourceTree from commandline
alias srctree='open -a SourceTree'

# Start/Stop server
alias start-server='brew services run mariadb; php-fpm -D; sudo nginx'
alias stop-server='brew services stop mariadb; killall php-fpm; sudo nginx -s stop'
