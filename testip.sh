#!/bin/sh
clear
Green_font_prefix="\033[32m"
Red_font_prefix="\033[31m" 
Green_background_prefix="\033[42;37m" 
Red_background_prefix="\033[41;37m" 
Font_color_suffix="\033[0m"
clear
echo && echo -e "
 ${Green_font_prefix}1.${Font_color_suffix} 安装需要测试软件
 ${Green_font_prefix}2.${Font_color_suffix} 测试ip"
read -p " 请输入数字 [0-2]:" num
 case "$num" in
	 1)
		 apt install -y nmap
		 clear
	;;

	2)
		echo -e "${Red_font_prefix}请先安装测试软件${Font_color_suffix}"
		echo -e "输入你需要测试的ip地址"
		read address
		echo -e "输入你需要测试的端口号"
		read port
		TMPSTR=`ping ${address} -c 1 | sed '1{s/[^(]*(//;s/).*//;q}'`
		check_ip=`nmap $TMPSTR -p $port|grep open|wc -l`
		if [ $check_ip -eq 0 ];then
			echo "端口或ip挂了"
		else
			echo "端口或ip正常"
		fi
	;;
esac
