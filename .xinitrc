cd ~
export TERM="/usr/bin/alacritty"
#xrandr --setprovideroutputsource modesetting NVIDIA-0 &
#xrandr --auto &

# Using some dpi and font settings for X Resources
xrdb -merge ~/.Xresources
# xrandr --output eDP1 --scale 0.8x0.8

setxkbmap -layout "us,ru" -option "grp:alt_shift_toggle"
#picom &

# Programs
# Screenshot app
flameshot &

# Wallpapers
nitrogen --restore &

sxhkd &
redshift &
dunst &
brave &
dropbox-cli start &
telegram-desktop &
keepassx2 &
code &
dwmblocks &
exec dwm
