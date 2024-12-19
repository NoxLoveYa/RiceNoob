#!/bin/bash

# Check if the image path is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <image_path>"
    exit 1
fi

# Get the input image path
input_image="$1"
image_name=$(basename "$input_image")

# Define the destination path
destination="$HOME/.config/wallpapers/$image_name"

# Check if the source and destination are the same
if [ "$input_image" = "$destination" ]; then
    echo "Error: The source and destination are the same. No copy needed."
    exit 1
fi

# Copy the image to the wallpapers folder
cp "$input_image" "$destination" >/dev/null 2>&1
# Check if the copy was successful
if [ $? -eq 0 ]; then
    echo "Wallpaper changed successfully!"
else
    echo "Error: Failed to copy the wallpaper."
fi

# Change the wallpaper
hyprctl hyprpaper unload all
hyprctl hyprpaper preload "$HOME/.config/wallpapers/$image_name" >/dev/null 2>&1
hyprctl hyprpaper wallpaper ", $HOME/.config/wallpapers/$image_name" >/dev/null 2>&1

echo "preload = ~/.config/wallpapers/$image_name
wallpaper = , ~/.config/wallpapers/$image_name
" > ~/.config/hypr/hyprpaper.conf

echo "Wallpaper changed successfully!"
