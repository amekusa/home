# ---------------------------------------
#  Fish Configuration
#  Place this at: ~/.config/fish/conf.d/
# =======================================

# cd then ls
function cd
    if count $argv > /dev/null
        builtin cd "$argv"; and ls
    else
        builtin cd ~; and ls
    end
end
