#!/bin/bash

WAIT=15

echo "Maintenance tasks will start in $WAIT seconds ..."
echo "Display will be turned off."

sleep $WAIT
caffeinate -i &
pmset displaysleepnow

echo
echo "---- HOMEBREW ----"
brew update
brew upgrade
brew autoremove
brew cleanup

echo
echo "---- NPM ----"
npm update -g

echo
echo "---- COMPOSER ----"
composer global update

echo
echo "All done."
echo

pkill -P $$

echo
