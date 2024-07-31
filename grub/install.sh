#! /usr/bin/env bash

THEME_DIR="/usr/share/grub/themes"
THEME_NAME=$1

if [ -z "$THEME_NAME" ]; then
    echo "Please pass theme name as argument. Exiting..."
    exit 1
fi

echo "Copying theme"
sudo rm -rf "$THEME_DIR"/"$THEME_NAME"
sudo cp -r "$THEME_NAME" "$THEME_DIR"

echo "Adding theme to confing"
sudo sed -i "s|.*GRUB_THEME=.*|GRUB_THEME=\"${THEME_DIR}/${THEME_NAME}/theme.txt\"|" /etc/default/grub

echo "Updating Grub"
sudo grub-mkconfig -o /boot/grub/grub.cfg

