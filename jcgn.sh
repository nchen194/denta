#!/bin/sh
echo "输入root密码"
read password
apt-get -y install wget vim curl git
echo root:${password}|chpasswd
alias vi="vim"
cp /etc/ssh/sshd_config /etc/ssh/sshd_config_backup
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
systemctl restart sshd
wget --no-check-certificate -q -O bbr2.sh "https://github.com/yeyingorg/bbr2.sh/raw/master/bbr2.sh" && chmod +x bbr2.sh && bash bbr2.sh auto
