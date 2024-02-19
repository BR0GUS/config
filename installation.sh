#!/bin/bash

# Enable dotglob to include hidden files
shopt -s dotglob

# Move all files from config/ to ~/.config/, prompt before overwrite
rm -fr ~/.config/hypr
mv ~/config/* ~/.config/
rm -fr usr/share/fonts/
mv ~/.config/fonts/* /usr/share/fonts/

# Disable dothlob to revert to default behavior
shopt -u dotglob
