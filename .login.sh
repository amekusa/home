#/bin/sh

# === Custom Login Script ===
# Use this as the startup script of your terminal emulator.
# (For Alacritty: 'shell.program')

# Checks if the program passed by the 1st argument callable.
# If it is not, starts the default shell instead.
if ! command -v "$1" 2>&1 >/dev/null
	then exec -l "$SHELL"
	else exec "$@"
fi

