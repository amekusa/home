#!/bin/bash
BASE="$HOME/.sh"
. "$BASE/lib/styles.sh"

WAIT=30

echo "Maintenance tasks will start in $WAIT seconds..."
echo "Display will be turned off."

sleep $WAIT
caffeinate -i &
pmset displaysleepnow

echo
echo -e "---- ${B_}HOMEBREW${RST} ----"
brew update
brew upgrade
brew cleanup

echo
echo -e "---- ${B_}NPM${RST} ----"
npm update -g

echo
echo -e "---- ${B_}COMPOSER${RST} ----"
composer global update

echo
pkill -P $$
echo
echo "All done."
echo
