#!/bin/bash

get_data() {
HOSTNAME=$(hostname)
TIMEZONE=$(timedatectl | grep "Time zone" | awk '{print $3 $4 $5}')
USER=$(whoami)
OS="$(lsb_release -is) $(lsb_release -rs)"
#OS="$(uname -o) $(uname -r)"|| cat /etc/lsb-release
#OS="$(sw_vers -productName) $(sw_vers -productVersion)" – for macOS
DATE="$(date '+%d %B %Y %H:%M:%S')"
UPTIME=$(uptime -p)
UPTIME_SEC=$(cat /proc/uptime | awk '{print $1}')

IP="$(hostname -I | awk '{print $1}')"
MASK="$(ifconfig | grep netmask | awk '{print $4}' | head -n 1)"
GATEWAY="$(ip route | grep default | head -n 1 | awk '{print $3}' )"

RAM_TOTAL="$(free -h --giga | grep Mem | awk '{printf("%.3f GB", $2)}')"
RAM_USED="$(free -h --giga | grep Mem | awk '{printf("%.3f GB", $3)}')"
RAM_FREE="$(free -h --giga | grep Mem | awk '{printf("%.3f GB", $4)}')"
SPACE_ROOT="$(df -m /root | grep -v block |  awk '{printf("%.2f MB\n", $2)}')"
SPACE_ROOT_USED="$(df -m /root | grep -v block |  awk '{printf("%.2f MB\n", $3)}')"
SPACE_ROOT_FREE="$(df -m /root | grep -v block |  awk '{printf("%.2f MB\n", $4)}')"
}

echo_data() {
    echo -e "HOSTNAME = $HOSTNAME\nTIMEZONE = $TIMEZONE"
    echo "USER = $USER"
    echo -e "OS = $OS\nDATE = $DATE"
    echo -e "UPTIME = $UPTIME\nUPTIME_SEC = $UPTIME_SEC"
    echo -e "IP = $IP\nMASK = $MASK\nGATEWAY = $GATEWAY"
    echo -e "RAM_TOTAL = $RAM_TOTAL\nRAM_USED = $RAM_USED\nRAM_FREE = $RAM_FREE"
    echo -e "SPACE_ROOT = $SPACE_ROOT\nSPACE_ROOT_USED = $SPACE_ROOT_USED"
    echo "SPACE_ROOT_FREE = $SPACE_ROOT_FREE"
}

