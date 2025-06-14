cd ~Add commentMore actions
export TERM="/usr/bin/alacritty"

# Using some dpi and font settings for X Resources
xrdb -merge ~/.Xresources

setxkbmap -layout "us,ru" -option "grp:alt_shift_toggle"

# Programs
# Screenshot app
flameshot &

# Wallpapers
nitrogen --restore &

sxhkd &
redshift &
dunst &
brave &

dwmblocks &
thinkfan -q &
syncthing &

exec ~/.startdwm
