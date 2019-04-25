#!/bin/bash

##### open vim ~/.logs/monthlylog.txt
#
/usr/bin/gvim ~/.logs/monthlylog.txt &

n=$((RANDOM%8+2))
echo $n
sleep $n

##### open terminals
#
#geometry "<width>x<height>+<xoffset>+<yoffset>"
#first monitor
#/usr/bin/gnome-terminal --geometry=192x68+0+1920 &
/usr/bin/xfce4-terminal --geometry=196x57+0+1920 &

##### open file-managers
#
#nemo /media/ronvox/DATA/
xdg-open /home/ronvox/Downloads/

##### open browsers
#
#second monitor
/usr/bin/xfce4-terminal --geometry=196x57+1920+0 &

n=$((RANDOM%8+2))
echo $n
sleep $n

xdg-open /home/ronvox/Documents/ &

/usr/bin/google-chrome -new-window "https://www.google.com" &

#/usr/bin/firefox -new-window  &

##### open other tools (filezilla, gimp)
#
#/usr/bin/gimp &
#/usr/bin/filezilla &

##### open projects
#
#/usr/bin/gvim /var/www/test/html/index.html /var/www/test/html/assets/css/cover.css
#/usr/bin/gvim /var/www/lab/html/sql01/index.php /var/www/lab/html/sql03/index.php
#/usr/bin/gvim /var/www/lab/html/phpsols/connection.inc.php
#/usr/bin/gvim /var/www/site05/html/contact.php

echo "all done!"
exit
