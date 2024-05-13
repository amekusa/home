#!/usr/bin/env bash
BASE="$HOME/.sh"
. "$BASE/lib/ush/load" format; _ansi

WAIT=45

echo "Maintenance tasks will start in $WAIT seconds..."
echo "Display will be turned off."

sleep $WAIT
caffeinate -i &
pmset displaysleepnow

started_at=$(date +%s)

echo
echo -e "---- ${b_}HOMEBREW${RST} --------"
brew update
brew upgrade
brew cleanup

echo
echo -e "---- ${b_}NPM${RST} --------"
npm update -g

echo
echo -e "---- ${b_}COMPOSER${RST} --------"
composer global update

ended_at=$(date +%s)
elapsed=$((ended_at - started_at))

echo
pkill -P $$
echo
echo
echo -e "All done. (took ${YLW}${elapsed}${RST}s)"
echo
