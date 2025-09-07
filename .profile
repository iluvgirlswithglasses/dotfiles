
### disable black screen after inactivity
xset s off
xset -dpms
xset s noblank

### screen settings
xrandr --output DP-0 --mode 1920x1080 --pos 0x600 --rotate normal 
xrandr --output HDMI-1 --pos 1920x0 --rotate right

### add environment variables
export QT_QPA_PLATFORMTHEME=kde # options: kde, qt5ct, gtk

