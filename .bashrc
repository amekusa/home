#  Bash Configuration
# -------------------- ////

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

# NVM (Node Version Manager)
# NOTE: To install NVM:
# $ cd
# $ git clone https://github.com/nvm-sh/nvm.git .nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
