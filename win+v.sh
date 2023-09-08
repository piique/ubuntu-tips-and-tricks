#!/bin/bash

# Update packages
echo "Updating packages..."
sudo apt update

# Install required programs
echo "Installing required programs..."
sudo apt install -y rofi xclip xdotool

# Download and move greenclip to /usr/local/bin
echo "Downloading and installing greenclip..."
wget https://github.com/erebe/greenclip/releases/download/v4.2/greenclip
chmod +x greenclip
sudo mv greenclip /usr/local/bin

# Add greenclip to .xprofile
echo "Configuring greenclip to start with the session..."
if ! grep -q "greenclip daemon" ~/.xprofile; then
    echo "greenclip daemon &" >> ~/.xprofile
fi

# Configure keyboard shortcut
# You'll need to manually add the shortcut via GNOME settings as indicated before.
# Unfortunately, setting custom shortcuts via the command line is tricky due to how GNOME stores shortcuts.

echo "Script completed!"
echo "Please manually add the keyboard shortcut for:"
echo "sh -c 'selection=$(greenclip print | rofi -dmenu -i -p \"Clipboard\"); echo -n \"$selection\" | xclip -selection clipboard && xdotool key --clearmodifiers ctrl+shift+v'"
