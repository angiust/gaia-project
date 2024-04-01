#!/bin/bash

output=$(./play fav0 game)
[[ $! -eq 0 ]] || echo 'command error' >&2
[[ $output = '0' ]] || echo "output ($output) different from 0" >&2

output=$(./play nonexistent_player game)
[[ $! -eq 0 ]] || echo 'command error' >&2
