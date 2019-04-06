#/bin/bash
function opera {
  echo "Installing opera, getting keyring..."
  wget -qO- https://deb.opera.com/archive.key | sudo apt-key add -
  echo "Installing repository..."
  sudo add-apt-repository "deb [arch=i386,amd64] https://deb.opera.com/opera-stable/ stable non-free"
  echo "Installing Opera..."
  sudo apt install opera-stable
  echo "Opera Installed!"
}

function vivaldi {
  echo "Installing Vivaldi getting key..."
  wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | sudo apt-key add
  echo "Installing repository..."
  sudo add-apt-repository 'deb https://repo.vivaldi.com/archive/deb/ stable main'
  echo "Installing Vivaldi..."
  sudo apt update && sudo apt install vivaldi-stable
  echo "Vivaldi Installed!"
}

function brave {
  echo "Installing Brave, getting keyring..."
  curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
  source /etc/os-release
  echo "Installing keyring..."
  echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ $UBUNTU_CODENAME main" | sudo tee /etc/apt/sources.list.d/brave-browser-release-${UBUNTU_CODENAME}.list
  sudo apt update
  echo "Installing Brave..."
  sudo apt install brave-keyring brave-browser
  echo "Brave Installed!"
}

title="Browser Install"
prompt="Which browser will you install today?"
options=("Google Chrome" "Opera" "Vivaldi" "Brave" "Firefox Uninstall")

echo "$title"
PS3="$prompt "
select opt in "${options[@]}" "Quit"; do

    case "$REPLY" in

    1 ) echo "Downloading Chrome..." && wget "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb" && echo "Installing Chrome..." && sudo apt install ./google-chrome-stable_current_amd64.deb && rm google-chrome-stable_current_amd64.deb && echo "Chrome Installed!"
;;
    2 ) opera;;
    3 ) vivaldi;;
    4 ) brave;;
    5 ) echo "Removing Firefox.." && sudo apt purge firefox && echo "Firefox Removed!";;

    $(( ${#options[@]}+1 )) ) break;;
    *) echo "Invalid option. Try another one.";continue;;

    esac

done
