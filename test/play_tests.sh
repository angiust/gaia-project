#!/bin/bash

# Test normal invocation of command "play" does not fail.
output=$(./play fav0 game)
[[ $? -eq 0 ]] || echo 'command error' >&2
# fav0 is a player which favours option number 0.
[[ $output = '0' ]] || echo "output ($output) different from 0" >&2

# Test error on nonexistent player.
./play nonexistent_player game 2>/dev/null
[[ $? -ne 0 ]] || echo 'program play does not return error on nonexistent player' >&2
