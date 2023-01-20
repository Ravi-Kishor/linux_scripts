#!/bin/bash
# Add grub background image
echo "Insert an image inside /boot/grub and name it splash0.png"
read -p "Press enter when you have done"
if [ -f /boot/grub/splash0.png ]  
 then
    echo "splash0.png detected"
 else
    echo "splash0.png is not present"
    break
 fi
KEYWORD="### BEGIN /etc/grub.d/05_debian_theme ###";
ESCAPED_KEYWORD=$(printf '%s\n' "$KEYWORD" | sed -e 's/[]\/$*.^[]/\\&/g');
sed -i "/$ESCAPED_KEYWORD/a /grub/splash0.png" theme.cfg
sudo update-grub
echo "done"