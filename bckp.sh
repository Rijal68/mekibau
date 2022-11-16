#!/bin/bash

IP=$(curl -sS ipv4.icanhazip.com);
domain=$(cat /etc/xray/domain)
date=$(date +"%Y-%m-%d")

source /root/botapi.conf
tokett=$toket 
chat_idcc=$chat_idc


sleep 1
mkdir -p /root/backup
cp -r /root/.acme.sh /root/backup/ &> /dev/null
cp /etc/passwd /root/backup/ &> /dev/null
cp /etc/group /root/backup/ &> /dev/null
cp -r /var/lib/scrz-prem/ /root/backup/scrz-prem &> /dev/null
cp -r /home/sstp /root/backup/sstp &> /dev/null
cp -r /etc/v2ray /root/backup/v2ray &> /dev/null
cp -r /etc/xray /root/backup/xray &> /dev/null
cp -r /etc/nginx/conf.d /root/backup/nginx &> /dev/null
cp -r /home/vps/public_html /root/backup/public_html &> /dev/null
cp -r /etc/cron.d /root/backup/cron.d &> /dev/null
cp /etc/crontab /root/backup/crontab &> /dev/null
cd /root
zip -r $ip.zip backup > /dev/null 2>&1

curl -F chat_id="$chat_idcc" -F document=@"$IP.zip" -F caption="Thank You For Using Our Service
Your Domain : $domain
Date       : $date
Your IP VPS  : $IP" https://api.telegram.org/bot$tokett/sendDocument &> /dev/null

rm -rf /root/backup &> /dev/null
rm -rf /root/user-backup &> /dev/null
rm -f /root/$NameUser.zip &> /dev/null
rm -f /root/$IP.zip &> /dev/null