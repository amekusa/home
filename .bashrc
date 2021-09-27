#  Bash Configuration
# ------------------- ////

# Launch tmux
[ -z "$TMUX" ] && exec tmux

# Reload the current shell
sh=bash
[ -z $ZSH_VERSION ] || sh=zsh
alias reload="echo 'Reloading .${sh}rc ...' &&. ~/.${sh}rc"

# Shortcuts for ls with some options
alias ls='ls -G'
alias ll='ls -l'
alias la='ls -la'

# Run the previous command with sudo
alias plz='sudo $(fc -ln -1)'

# lazygit
alias lg='lazygit'

# fix micro + tmux conflicts
alias micro='TERM=xterm-256color micro'

# NPM Shortcuts
alias nrun='npm run'
alias nbuild='npm run build'
alias ntest='npm run test'
alias nwatch='npm run watch'

# googler
alias gg='googler -l en -g us'

# Start/Stop server
alias start-server='brew services run mariadb; php-fpm -D; sudo nginx'
alias stop-server='brew services stop mariadb; killall php-fpm; sudo nginx -s stop'

# Search utility
f() {
  if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage:"
    echo "  f path query [maxdepth]"
    return 1
  fi
  local depth=2
  [ -z "$3" ] || depth="$3"
  find $1 -name "*${2}*" -maxdepth "$depth"
}

# NVM (Node Version Manager)
# NOTE: To install NVM:
#       $ cd
#       $ git clone https://github.com/nvm-sh/nvm.git .nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NODE_PATH="$(npm root -g)"
