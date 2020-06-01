#!/bin/sh
clear
echo && echo -e "
 ${Green_font_prefix}1.${Font_color_suffix} redir-host更换成fake-ip
 ${Green_font_prefix}2.${Font_color_suffix} fake-ip更换redir-host"
read -p " 请输入数字 [0-3]:" num
 case "$num" in
	 1) 
		 sed -i 's/enhanced-mode: redir-host/enhanced-mode: fake-ip/g' /home/clash/.config/clash/config.yaml
	;;
	2)
		sed -i 's/enhanced-mode: fake-ip/enhanced-mode: redir-host/g' /home/clash/.config/clash/config.yaml
	;;
esac
