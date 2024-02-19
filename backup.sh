#!/bin/bash

# include hidden files
shopt -s dotglob

config_folders=("hypr" "kitty" "nvim" "qt5ct" "rofi" "tmux" "waybar" "gtk-3.0")

script_dir=$(dirname "$(readlink -f "$0")")

for folder in "${config_folders[@]}"; do
    src="$HOME/.config/${folder}"
    
    if [ -d "${src}" ]; then
        sudo cp -r "${src}" "${script_dir}"
        echo "Copied ${src} to ${script_dir}"
    else
        echo "Folder ${src} does not exist"
    fi
done

fonts_dir="/usr/share/fonts"

if [ -d "${fonts_dir}" ]; then
    sudo cp -r "${fonts_dir}" "$script_dir"
    echo "Copied fonts"
else
    echo "Fonts directory does not exist"
fi

wallpaper_dir="$HOME/wallpapers"

if [ -d "${wallpaper_dir}" ]; then
    sudo cp -r "${wallpaper_dir}" "$script_dir"
    echo "Copied wallpapers"
else
    echo "Wallpapers folder does not exist"
fi

commit_message=$(date +"%d-%m-%Y %H:%M")

git add .

git commit -m "Backup on ${commit_message}"

git push

shopt -u dotglob
