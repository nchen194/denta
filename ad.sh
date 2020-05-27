#!/bin/sh
if [ -f "/etc/smartdns/anti-ad-smartdns.conf" ];then
	rm -rf /etc/smartdns/anti-ad-smartdns.conf
        cd /etc/smartdns/
        wget https://raw.githubusercontent.com/privacy-protection-tools/anti-AD/master/anti-ad-smartdns.conf
        cd ~
        systemctl restart smartdns
else
        cd /etc/smartdns/
        wget https://raw.githubusercontent.com/privacy-protection-tools/anti-AD/master/anti-ad-smartdns.conf
        cd ~
        #crontab -l > conf && 
	echo -e "00 02 * * * /bin/bash /root/ad.sh" >> conf && crontab conf && rm -f conf
       /sbin/service cron reload
        echo -e "conf-file /etc/smartdns/anti-ad-smartdns.conf" >> /etc/smartdns/smartdns.conf
       systemctl restart smartdns
fi

