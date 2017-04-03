#!/bin/bash -       
#description     :
#author          :Michele Gazzetti
#date            :03.04.17
#notes           :
#==============================================================================

print_usage(){
    (>&2 echo -e "Usage: \n\t./create_desktop_launcher.sh -n name -c command\n")
    exit 1
}
if [[ $# -le 1 ]]; then
    print_usage
fi
while [[ $# -gt 1 ]]; do
    key="$1"
    case $key in
        -n|-name)
            NAME="$2"
            shift
            ;;
        -c|-command)
            COMMNAND="$2"
            shift
            ;;
        *)
            print_usage
            ;;
    esac
    shift
done

PICTURE="$PWD/../png/zombie_hand.png"

cat << EOF > ~/.local/share/applications/${NAME}.desktop
[Desktop Entry]
Type=Application
Encoding=UTF-8
Name=${NAME}
Exec=/bin/bash ${COMMNAND}
Icon=${PICTURE}
Terminal=false
EOF

