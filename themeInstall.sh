#/bin/bash

function themeDone {
  echo "Theme changed!"
}

function adapta {
  options=("Adapta" "Adapta Eta (Compact)" "Adapta Nokto (Dark)" "Adapta Nokto Eta(Compact Dark)")

  select opt in "${options[@]}" "Quit"; do

      case "$REPLY" in

      1 ) echo "Changing theme..." && gsettings set org.gnome.desktop.interface gtk-theme "Arc" && gsettings set org.gnome.desktop.wm.preferences theme "Arc" && themeDone;;
      2 ) echo "Changing theme..." && gsettings set org.gnome.desktop.interface gtk-theme "Arc-Darker" && gsettings set org.gnome.desktop.wm.preferences theme "Arc" && themeDone;;
      3 ) echo "Changing theme..." && gsettings set org.gnome.desktop.interface gtk-theme "Arc-Dark" && gsettings set org.gnome.desktop.wm.preferences theme "Arc-Dark" && themeDone;;

      $(( ${#options[@]}+1 )) ) options=("Arc" "Materia" "Adapta") && break ;;
      *) echo "Invalid option. Try another one.";continue;;

      esac

  done
}

function materia {
  options=("Materia" "Materia Light" "Materia Dark")

  select opt in "${options[@]}" "Quit"; do

      case "$REPLY" in

      1 ) echo "Changing theme..." && gsettings set org.gnome.desktop.interface gtk-theme "Materia" && gsettings set org.gnome.desktop.wm.preferences theme "Materia" && themeDone;;
      2 ) echo "Changing theme..." && gsettings set org.gnome.desktop.interface gtk-theme "Materia-light" && gsettings set org.gnome.desktop.wm.preferences theme "Materia-light" && themeDone;;
      3 ) echo "Changing theme..." && gsettings set org.gnome.desktop.interface gtk-theme "Materia-dark" && gsettings set org.gnome.desktop.wm.preferences theme "Materia-dark" && themeDone;;

      $(( ${#options[@]}+1 )) ) options=("Arc" "Materia" "Adapta") && break ;;
      *) echo "Invalid option. Try another one.";continue;;

      esac

  done
}

function arc {
  options=("Arc" "Arc Darker" "Arc Dark")

  select opt in "${options[@]}" "Quit"; do

      case "$REPLY" in

      1 ) echo "Changing theme..." && gsettings set org.gnome.desktop.interface gtk-theme "Arc" && gsettings set org.gnome.desktop.wm.preferences theme "Arc" && themeDone;;
      2 ) echo "Changing theme..." && gsettings set org.gnome.desktop.interface gtk-theme "Arc-Darker" && gsettings set org.gnome.desktop.wm.preferences theme "Arc" && themeDone;;
      3 ) echo "Changing theme..." && gsettings set org.gnome.desktop.interface gtk-theme "Arc-Dark" && gsettings set org.gnome.desktop.wm.preferences theme "Arc-Dark" && themeDone;;

      $(( ${#options[@]}+1 )) ) options=("Arc" "Materia" "Adapta") && break ;;
      *) echo "Invalid option. Try another one.";continue;;

      esac

  done
}

title="GTK Themes"
prompt="Which theme will you download and enable?"
options=("Arc" "Materia" "Adapta")

echo "$title"
PS3="$prompt "
select opt in "${options[@]}" "Quit"; do

    case "$REPLY" in

    1 ) sudo apt install arc-theme && arc;;
    2 ) sudo apt install materia-gtk-theme && materia;;
    3 ) sudo add-apt-repository ppa:tista/adapta && sudo apt update && adapta;;

    $(( ${#options[@]}+1 )) ) break;;
    *) echo "Invalid option. Try another one.";continue;;

    esac

done
