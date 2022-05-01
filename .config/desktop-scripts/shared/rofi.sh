#! /bin/sh

export SUDO_ASKPASS="$(dirname "$0")/shared/rofi_ask_pass.sh"

rofi_sudo() {
    sudo -A $@
}

rofi_ask() {
    echo -e "$1" | tr -s "\n" | rofi -dmenu -no-fixed-num-lines -p 'Select Action'
}