#/bin/sh
if ! command -v "$1" 2>&1 >/dev/null
	then exec -l "$SHELL"
	else exec "$@"
fi

