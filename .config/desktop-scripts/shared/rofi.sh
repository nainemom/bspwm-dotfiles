#! /bin/sh

export SUDO_ASKPASS="$(dirname "$0")/shared/rofi_ask_pass.sh"

rofi_sudo() {
    sudo -A $@
}

rofi_ask() {
    selected_row=0
    selected_text=$2
    options=$1
    if [[ ! -z "$selected_text" ]]; then
        IFSBAK=$IFS
        IFS=$'\n'
        for line in $options
        do
            if [[ "$line" == "$selected_text" ]]; then
                break
            else
                ((selected_row++))
            fi
        done
        IFS=$IFSBAK
    fi
    echo -e "$options" | tr -s "\n" | rofi -dmenu -no-fixed-num-lines -p "Select Action" -selected-row $selected_row
}