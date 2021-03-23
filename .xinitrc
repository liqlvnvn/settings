cd ~
export TERM="/usr/bin/alacritty"
#xrandr --setprovideroutputsource modesetting NVIDIA-0 &
#xrandr --auto &
setxkbmap -layout us,ru -option grp:alt_shift_toggle
#picom &
nitrogen --restore &
sxhkd &
redshift &
dunst &
brave &
dropbox-cli start &
telegram-desktop &
keepassx2 &
dwmblocks &
exec dwm
