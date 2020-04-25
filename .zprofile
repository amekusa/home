# --------------------------------
#  ZSH Configuration
#  Place this at: ~/
# ================================

# Inherit envs & aliases from BASH
source ~/.profile

# Autocompletion
autoload -Uz compinit && compinit

# cd hook (cd then ls)
function chpwd() {
    emulate -L zsh
    ls
}
