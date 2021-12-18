#  shell functions and aliases
# ----------------------------- ---- -- -

# reload the current shell
sh=bash
[ -z $ZSH_VERSION ] || sh=zsh
alias reload="echo 'Reloading .${sh}rc ...' &&. ~/.${sh}rc"

# ls with options
alias ls='ls -pG'
alias ll='ls -phlG'
alias la='ls -phAlG'

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

# googler
alias gg='googler -l en -g us'

# start/stop server
alias start-server='brew services run mariadb; php-fpm -D; sudo nginx'
alias stop-server='brew services stop mariadb; killall php-fpm; sudo nginx -s stop'

# find
f() {
  if [ -z "$1" ]; then
    echo "Usage:"
    echo "  f query [basedir] [maxdepth]"
    return 1
  fi
  local dir='.'; [ -z "$2" ] || dir="$2"
  local depth=2; [ -z "$3" ] || depth="$3"
  find "$dir" -maxdepth "$depth" -iname "*${1}*"
}

# find & cd
fcd() {
  if [ -z "$1" ]; then
    echo "Usage:"
    echo "  fcd query [basedir] [maxdepth]"
    return 1
  fi
  local dir='.'; [ -z "$2" ] || dir="$2"
  local depth=2; [ -z "$3" ] || depth="$3"
  local dest=$(find "$dir" -maxdepth "$depth" -type d -iname "*${1}*" -print -quit)
  if [ -z $dest ]; then
    echo "'${1}' is not found"
    return 1
  fi
  cd "$dest"
}
