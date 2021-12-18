#  bash setup
# ------------ ---- -- -

source ~/.sh/fn.sh

# NVM (Node Version Manager)
# NOTE: To install NVM:
#       $ cd
#       $ git clone https://github.com/nvm-sh/nvm.git .nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NODE_PATH="$(npm root -g)"
