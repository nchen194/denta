#!/bin/sh
time="`date +%m`-`date +%d` `date +%I`:`date +%M` `date +%p`"
day="`date +%m`-`date +%d`"
log_file=/home/log/backup${day}.log
cp  -rf /home/clash/.config/clash/config.yaml /home/clash/.config/clash/config_${day}.yaml
#mv -f /home/clash/.config/clash/config_${day}.conf /home/clash/.config/clash/config.yaml
