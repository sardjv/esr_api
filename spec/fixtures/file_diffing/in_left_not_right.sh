#!/bin/sh
# To run: bash in_left_not_right.sh

# This script will print any lines which are in the left hand file but not the right hand file.
# Comm can do the opposite, or more, see docs: https://linux.die.net/man/1/comm

comm -23 <(sort left_hand_file.DAT) <(sort right_hand_file.DAT)

