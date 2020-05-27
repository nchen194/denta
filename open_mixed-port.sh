#!/bin/sh
clear
Green_font_prefix="\033[32m"
Red_font_prefix="\033[31m" 
Green_background_prefix="\033[42;37m" 
Red_background_prefix="\033[41;37m" 
Font_color_suffix="\033[0m"
echo && echo -e "
 ${Green_font_prefix}1.${Font_color_suffix} 开启mixed-port
 ${Green_font_prefix}2.${Font_color_suffix} 设置用户名密码
 ${Green_font_prefix}3.${Font_color_suffix} 启本地http代理端口"
read -p " 请输入数字 [0-3]:" num
 case "$num" in
	1)
		echo -e "输入你需要代理的端口号"
		read port
		sed -i 's/port: 7890/#port: 7890/g' /home/clash/.config/clash/config.yaml
		sed -i 's/socks-port: 7891/#socks-port: 7891/g' /home/clash/.config/clash/config.yaml
		sed -i 's/mixed-port/#mixed-port/g' /home/clash/.config/clash/config.yaml
		echo -e "mixed-port: ${port}" >> /home/clash/.config/clash/config.yaml
	;;
	2)
		echo -e "${Red_background_prefix}设置验证后安卓部分应用无法使用${Font_color_suffix}"
		echo "输入需要验证用户名"
		read user
		echo "输入需要验证密码"
		read password
		echo -e "authentication:\n  - ${user}:${password}" >> /home/clash/.config/clash/config.yaml
		systemctl restart clash@clash.service
	;;
	3)
	echo "本地http代理端口号："
	read port
	echo -e "export http_proxy=”http://127.0.0.1:${port}/" >> /etc/profile
	source /etc/profile
	;;
	*)
	clear
	echo -e "${Error}:请输入正确数字 [1-2]"
esac
