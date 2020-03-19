#! /bin/bash

# sudo -E bash /opt/Central-InfoSec/Kali-Linux-Theme/kali-linux-theme.sh kali

# Set the name for PS1, image paths, and hostname
name="Central-InfoSec"

# Set the user for su
user="kali"

su $user -m -c '

# Set the name for PS1, image paths, and hostname
name="Central-InfoSec"

# Set the user and user path
user="kali"
userPath="/home/$user"

# Set the prompt to show the name, date, time, path, and if the UID is 0
echo '"'"'PS1="\[\033[01;31m\]\D{'"'"'$name'"'"'} \[\033[00;37m\]\D{%F} \[\033[00;37m\]\D{%T} \[\033[01;34m\]\W\[\033[00;37m\]\\$\[\033[0m\] "'"'"' >> $userPath/.bashrc

# Set the clock to show the date
xfconf-query -c xfce4-panel -p /plugins/plugin-14/digital-format -n -t string -s "%m-%d-%y  %I:%M %p"
xfconf-query -c xfce4-panel -p /plugins/plugin-14/tooltip-format -n -t string -s "%m-%d-%y  %I:%M %p"

# Set the background, screensaver, and profile images
# /usr/share/backgrounds/kali/kali-logo.xml
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorVirtual1/workspace0/last-image -s "/opt/$name/Kali-Linux-Theme/img/background-small.png"

# Set the image options
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorVirtual1/workspace0/image-style -s "3" # Stretched
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorVirtual1/workspace0/image-style -s "1" # Centered

# Set the background color to black
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorVirtual1/workspace0/rgba1 -n -a -t double -s 0.0 -t double -s 0.0 -t double -s 0.0 -t double -s 1.0
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorVirtual1/workspace0/color-style -s "0"

# Set the click policy to open files and directories with a single click
xfconf-query -c xfce4-desktop -p /desktop-icons/single-click -n -t string -s "true"
xfconf-query -c thunar -p /misc-single-click -n -t string -s "true"

# Focus on windows by hover instead of click
xfconf-query -c xfwm4 -p /general/click_to_focus -n -t bool -s "false"

# Raise window on focus
xfconf-query -c xfwm4 -p /general/raise_on_focus -n -t bool -s "true"

# Get the panel number
panelNumber=$(xfconf-query -c xfce4-panel -p /panels | grep -v "Value is an\|^$")

# Create the launcher directory
mkdir $userPath/.config/xfce4/panel/launcher-100
mkdir $userPath/.config/xfce4/panel/launcher-101
mkdir $userPath/.config/xfce4/panel/launcher-102
mkdir $userPath/.config/xfce4/panel/launcher-103

# Copy the .desktop files into the launcher directories
cp /usr/share/applications/mousepad.desktop $userPath/.config/xfce4/panel/launcher-101
cp /usr/share/applications/firefox-esr.desktop $userPath/.config/xfce4/panel/launcher-102
cp /usr/share/applications/kali-burpsuite.desktop $userPath/.config/xfce4/panel/launcher-103

echo "[Desktop Entry]" > $userPath/.config/xfce4/panel/launcher-100/tilix.desktop
echo "Version=1.0" >> $userPath/.config/xfce4/panel/launcher-100/tilix.desktop
echo "Name[en]=Tilix" >> $userPath/.config/xfce4/panel/launcher-100/tilix.desktop
echo "Name=Tilix" >> $userPath/.config/xfce4/panel/launcher-100/tilix.desktop
echo "Comment[en]=A tiling terminal for Gnome" >> $userPath/.config/xfce4/panel/launcher-100/tilix.desktop
echo "Comment=A tiling terminal for Gnome" >> $userPath/.config/xfce4/panel/launcher-100/tilix.desktop
echo "Keywords[en]=shell;prompt;command;commandline;cmd;" >> $userPath/.config/xfce4/panel/launcher-100/tilix.desktop
echo "Keywords=shell;prompt;command;commandline;cmd;" >> $userPath/.config/xfce4/panel/launcher-100/tilix.desktop
echo "Exec=tilix" >> $userPath/.config/xfce4/panel/launcher-100/tilix.desktop
echo "Terminal=false" >> $userPath/.config/xfce4/panel/launcher-100/tilix.desktop
echo "Type=Application" >> $userPath/.config/xfce4/panel/launcher-100/tilix.desktop
echo "StartupNotify=true" >> $userPath/.config/xfce4/panel/launcher-100/tilix.desktop
echo "Categories=System;TerminalEmulator;X-GNOME-Utilities;" >> $userPath/.config/xfce4/panel/launcher-100/tilix.desktop
echo "Icon[en]=com.gexperts.Tilix" >> $userPath/.config/xfce4/panel/launcher-100/tilix.desktop
echo "Icon=com.gexperts.Tilix" >> $userPath/.config/xfce4/panel/launcher-100/tilix.desktop
echo "DBusActivatable=true" >> $userPath/.config/xfce4/panel/launcher-100/tilix.desktop
echo "Actions=new-window;new-session;preferences;" >> $userPath/.config/xfce4/panel/launcher-100/tilix.desktop
echo "X-XFCE-Source=file:///usr/share/applications/com.gexperts.Tilix.desktop" >> $userPath/.config/xfce4/panel/launcher-100/tilix.desktop
echo "" >> $userPath/.config/xfce4/panel/launcher-100/tilix.desktop
echo "[Desktop Action new-window]" >> $userPath/.config/xfce4/panel/launcher-100/tilix.desktop
echo "Name[en]=New Window" >> $userPath/.config/xfce4/panel/launcher-100/tilix.desktop
echo "Name=New Window" >> $userPath/.config/xfce4/panel/launcher-100/tilix.desktop
echo "Exec=tilix --action=app-new-window" >> $userPath/.config/xfce4/panel/launcher-100/tilix.desktop
echo "" >> $userPath/.config/xfce4/panel/launcher-100/tilix.desktop
echo "[Desktop Action new-session]" >> $userPath/.config/xfce4/panel/launcher-100/tilix.desktop
echo "Name[en]=New Session" >> $userPath/.config/xfce4/panel/launcher-100/tilix.desktop
echo "Name=New Session" >> $userPath/.config/xfce4/panel/launcher-100/tilix.desktop
echo "Exec=tilix --action=app-new-session" >> $userPath/.config/xfce4/panel/launcher-100/tilix.desktop
echo "" >> $userPath/.config/xfce4/panel/launcher-100/tilix.desktop
echo "[Desktop Action preferences]" >> $userPath/.config/xfce4/panel/launcher-100/tilix.desktop
echo "Name[en]=Preferences" >> $userPath/.config/xfce4/panel/launcher-100/tilix.desktop
echo "Name=Preferences" >> $userPath/.config/xfce4/panel/launcher-100/tilix.desktop
echo "Exec=tilix --preferences" >> $userPath/.config/xfce4/panel/launcher-100/tilix.desktop

# Create the plugin groups
xfconf-query -c xfce4-panel -p /plugins/plugin-100 -t string -s "launcher" --create
xfconf-query -c xfce4-panel -p /plugins/plugin-101 -t string -s "launcher" --create
xfconf-query -c xfce4-panel -p /plugins/plugin-102 -t string -s "launcher" --create
xfconf-query -c xfce4-panel -p /plugins/plugin-103 -t string -s "launcher" --create

# Create the plugin items properties
xfconf-query -c xfce4-panel -p /plugins/plugin-100/items -t string -s "tilix.desktop" -a --create
xfconf-query -c xfce4-panel -p /plugins/plugin-101/items -t string -s "mousepad.desktop" -a --create
xfconf-query -c xfce4-panel -p /plugins/plugin-102/items -t string -s "firefox-esr.desktop" -a --create
xfconf-query -c xfce4-panel -p /plugins/plugin-103/items -t string -s "kali-burpsuite.desktop" -a --create

# Create a variable for the array
panelPluginArray=""
panelPluginArrayDefault=""

# Store the contents of the panel plugin ID array
panelPluginnumbers=$(xfconf-query -c xfce4-panel -p /panels/panel-$panelNumber/plugin-ids| grep -v "Value is an\|^$")
x=1
for i in $panelPluginnumbers; do
	if [[ "$x" -eq 6 ]]; then
		panelPluginArray+="-t int -s 100 -t int -s 101 -t int -s 102 -t int -s 103 "
	else
		panelPluginArray+="-t int -s $i "
	fi
	panelPluginArrayDefault+="-t int -s $i "
	((++x))
done

# Delete the panel plugin ID array
xfconf-query -c xfce4-panel -p /panels/panel-$panelNumber/plugin-ids -rR

# Create a new panel plugin ID array
xfconf-query -c xfce4-panel -p /panels/panel-$panelNumber/plugin-ids $panelPluginArray --create

# Reload the panel
xfce4-panel -r

# Reset panel
#xfconf-query -c xfce4-panel -p /panels/panel-1/plugin-ids -rR
#xfconf-query -c xfce4-panel -p /panels/panel-1/plugin-ids -t int -s 1 -t int -s 2 -t int -s 3 -t int -s 4 -t int -s 5 -t int -s 6 -t int -s 7 -t int -s 8 -t int -s 9 -t int -s 10 -t int -s 11 -t int -s 12 -t int -s 13 -t int -s 14 -t int -s 15 -t int -s 16 -t int -s 17 -t int -s 18 -t int -s 19 -t int -s 20 --create
#xfce4-panel -r

# Set a command to restart networking
echo "alias renet='"'"'sudo systemctl restart networking && sudo systemctl restart network-manager && curl ifconfig.me && echo "" && ip -o addr show up primary scope global | while read -r num dev fam addr rest; do echo \${addr%/*}; done && echo \"\"'"'"'" >> $userPath/.bashrc

# Set commands to turn hover to focus on and off
echo "alias hover-on='"'"'xfconf-query -c xfwm4 -p /general/click_to_focus -n -t bool -s false'"'"'" >> $userPath/.bashrc
echo "alias hover-off='"'"'xfconf-query -c xfwm4 -p /general/click_to_focus -n -t bool -s true'"'"'" >> $userPath/.bashrc

'

# Set up images
sudo cp /usr/share/backgrounds/kali/kali-logo.svg /usr/share/backgrounds/kali/kali-logo-BAK.svg
sudo cp /usr/share/backgrounds/kali/kali-logo-4x3.png /usr/share/backgrounds/kali/kali-logo-4x3-BAK.png
sudo cp /usr/share/backgrounds/kali/kali-logo-16x9.png /usr/share/backgrounds/kali/kali-logo-16x9-BAK.png
sudo cp /usr/share/backgrounds/kali/kali-logo-16x10.png /usr/share/backgrounds/kali/kali-logo-16x10-BAK.png
sudo cp /opt/Central-InfoSec/Kali-Linux-Theme/img/background-small.png /usr/share/backgrounds/kali/kali-logo.svg
sudo cp /opt/Central-InfoSec/Kali-Linux-Theme/img/background-small.png /usr/share/backgrounds/kali/kali-logo-4x3.png
sudo cp /opt/Central-InfoSec/Kali-Linux-Theme/img/background-small.png /usr/share/backgrounds/kali/kali-logo-16x9.png
sudo cp /opt/Central-InfoSec/Kali-Linux-Theme/img/background-small.png /usr/share/backgrounds/kali/kali-logo-16x10.png

sudo cp /usr/share/backgrounds/kali/kali-light.svg /usr/share/backgrounds/kali/kali-light-BAK.svg
sudo cp /usr/share/backgrounds/kali/kali-light-4x3.png /usr/share/backgrounds/kali/kali-light-4x3-BAK.png
sudo cp /usr/share/backgrounds/kali/kali-light-16x9.png /usr/share/backgrounds/kali/kali-light-16x9-BAK.png
sudo cp /usr/share/backgrounds/kali/kali-light-16x10.png /usr/share/backgrounds/kali/kali-light-16x10-BAK.png
sudo cp /opt/Central-InfoSec/Kali-Linux-Theme/img/screensaver.png /usr/share/backgrounds/kali/kali-light.svg
sudo cp /opt/Central-InfoSec/Kali-Linux-Theme/img/screensaver.png /usr/share/backgrounds/kali/kali-light-4x3.png
sudo cp /opt/Central-InfoSec/Kali-Linux-Theme/img/screensaver.png /usr/share/backgrounds/kali/kali-light-16x9.png
sudo cp /opt/Central-InfoSec/Kali-Linux-Theme/img/screensaver.png /usr/share/backgrounds/kali/kali-light-16x10.png

sudo cp /usr/share/backgrounds/kali/kali-blue-matrix.png /usr/share/backgrounds/kali/kali-blue-matrix-BAK.png
sudo cp /usr/share/backgrounds/kali/kali-black.png /usr/share/backgrounds/kali/kali-black-BAK.png
sudo cp /usr/share/backgrounds/kali/kali-rings.png /usr/share/backgrounds/kali/kali-rings-BAK.png
sudo cp /usr/share/backgrounds/kali/kali-small-logo.png /usr/share/backgrounds/kali/kali-small-logo-BAK.png
sudo cp /opt/Central-InfoSec/Kali-Linux-Theme/img/background-small.png /usr/share/backgrounds/kali/kali-black.png
sudo cp /opt/Central-InfoSec/Kali-Linux-Theme/img/background-small.png /usr/share/backgrounds/kali/kali-blue-matrix.png
sudo cp /opt/Central-InfoSec/Kali-Linux-Theme/img/background-small.png /usr/share/backgrounds/kali/kali-rings.png
sudo cp /opt/Central-InfoSec/Kali-Linux-Theme/img/background-small.png /usr/share/backgrounds/kali/kali-small-logo.png

sudo cp /usr/share/grub/themes/kali/grub-4x3.png /usr/share/grub/themes/kali/grub-4x3-BAK.png
sudo cp /usr/share/grub/themes/kali/grub-16x9.png /usr/share/grub/themes/kali/grub-16x9-BAK.png
sudo cp /boot/grub/themes/kali/grub-4x3.png /boot/grub/themes/kali/grub-4x3-BAK.png
sudo cp /boot/grub/themes/kali/grub-16x9.png /boot/grub/themes/kali/grub-16x9-BAK.png
sudo cp /opt/Central-InfoSec/Kali-Linux-Theme/img/background-small.png /usr/share/grub/themes/kali/grub-4x3.png
sudo cp /opt/Central-InfoSec/Kali-Linux-Theme/img/background-small.png /usr/share/grub/themes/kali/grub-16x9.png
sudo cp /opt/Central-InfoSec/Kali-Linux-Theme/img/background-small.png /boot/grub/themes/kali/grub-4x3.png
sudo cp /opt/Central-InfoSec/Kali-Linux-Theme/img/background-small.png /boot/grub/themes/kali/grub-16x9.png

# Profile image
sudo cp /opt/Central-InfoSec/Kali-Linux-Theme/img/profile.png /home/kali/.face

# Logon image
sudo cp /usr/share/icons/Flat-Remix-Blue-Dark/apps/scalable/kali-menu.svg /usr/share/icons/Flat-Remix-Blue-Dark/apps/scalable/kali-menu-BAK.svg
sudo cp /opt/Central-InfoSec/Kali-Linux-Theme/img/profile.png /usr/share/icons/Flat-Remix-Blue-Dark/apps/scalable/kali-menu.svg

# Allow the background image to be readable
chmod +r "/opt/$name/Kali-Linux-Theme/img/background-small.png"

# Set the hostname and update the hostname and hosts files
hostname=$name
echo "$hostname" > /etc/hostname
echo -e "127.0.0.1\t$hostname" >> /etc/hosts
hostnamectl set-hostname $hostname

# Open executables with mousepad
echo "[Added Associations]" > /etc/xfce4/defaults.list
echo "application/x-shellscript=mousepad.desktop" >> /etc/xfce4/defaults.list
echo "[Default Applications]" >> /etc/xfce4/defaults.list
echo "application/x-shellscript=mousepad.desktop" >> /etc/xfce4/defaults.list