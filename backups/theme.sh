
# PICK WALLPAPER
wallpaper=$(ls -1 ~/.config/wallpapers | grep ".jpg" | wofi --dmenu)

# GENERATE COLOR SCHEME
wal -i ~/.config/wallpapers/$wallpaper

# SET BACKGROUND
swww init
swww img --transition-type center  ~/.config/wallpapers/$wallpaper
rm -rf ~/.cache/swww

# COPY WALLPAPER
rm -rf ~/.config/wallpapers/current_wallpaper.jpg
cp -r ~/.config/wallpapers/$wallpaper ~/.config/wallpapers/current_wallpaper.jpg

# SPOTIFY
cp -r ~/.cache/wal/colors-spicetify.ini ~/.config/spicetify/Themes/Pywal
cd ~/.config/spicetify/Themes/Pywal
mv colors-spicetify.ini color.ini
pkill spicetify
spicetify -q watch -s & disown

# FIREFOX
pywalfox update

# SWAYLOCK
cp -r ~/.cache/wal/colors-swaylock ~/.config/swaylock
cd ~/.config/swaylock
mv colors-swaylock config

# GTK
oomox-cli -o oomox ~/.cache/wal/colors-oomox


cp -r $HOME/.cache/wal/colors-cava $HOME/.config/cava
cd $HOME/.config/cava
mv colors-cava config
pkill -USR1 cava
