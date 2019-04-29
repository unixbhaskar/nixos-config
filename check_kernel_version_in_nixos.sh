#!/usr/bin/env bash 

source $HOME/colors.sh
NOCOLOR="\033[0m"
source $HOME/spinner.sh

printf "\n\n\t\t\b\b ${Reverse}${Bright}${Yellow}Check Linux kernel version in repo ...wait ... ${NOCOLOR}\n\n"

(nix-env -qaP linux)&

spinner "$!" "Checking.."

