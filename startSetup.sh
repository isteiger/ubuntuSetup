#/bin/bash

title="Ubuntu Setup"
prompt="Which task whould you like to do?"
options=("Download Script Prerequisites" "Download Browser" "Update Ubuntu Packages" "Update Ubuntu Release" "Change GTK Theme")

echo "$title"
PS3="$prompt "
select opt in "${options[@]}" "Quit"; do

    case "$REPLY" in

    1 ) sudo apt update && sudo apt install curl wget;;
    2 ) bash ./browserInstall.sh;;
    3 ) sudo apt update && sudo apt upgrade;;
    4 ) sudo do-release-upgrade;;
    5 ) bash themeInstall.sh;;

    $(( ${#options[@]}+1 )) ) break;;
    *) echo "Invalid option. Try another one.";continue;;

    esac

done
