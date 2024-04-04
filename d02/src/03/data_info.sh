#!/bin/bash

# 1 - white, 2 - red, 3 - green, 4 - blue, 5 – purple, 6 - black

# Фон
declare -a colors
colors[1]="\033[47m"  # white
colors[2]="\033[41m"  # red
colors[3]="\033[42m"  # green
colors[4]="\033[44m"  # blue
colors[5]="\033[45m"  # purple
colors[6]="\033[40m"  # black

# Шрифт
declare -a font
font[1]="\033[37m"  # white
font[2]="\033[31m"  # red
font[3]="\033[32m"  # green
font[4]="\033[34m"  # blue
font[5]="\033[35m"  # purple
font[6]="\033[30m"  # black


CL="\033[0m"

get_data() {
HOSTNAME=$(hostname)
TIMEZONE=$(timedatectl | grep "Time zone" | awk '{print $3 $4 $5}')
USER=$(whoami)
OS="$(lsb_release -is) $(lsb_release -rs)"
DATE="$(date '+%d %B %Y %H:%M:%S')"
UPTIME=$(uptime -p)
UPTIME_SEC=$(cat /proc/uptime | awk '{print $1}')

IP="$(hostname -I | awk '{print $1}')"
MASK="$(ifconfig | grep netmask | awk '{print $4}' | head -n 1)"
GATEWAY="$(ip route | grep default | head -n 1 | awk '{print $3}' )"

RAM_TOTAL="$(free -h --giga | grep Mem | awk '{printf("%.3f GB", $2)}')"
RAM_USED="$(free -h --giga | grep Mem | awk '{printf("%.3f GB", $3)}')"
RAM_FREE="$(free -h --giga | grep Mem | awk '{printf("%.3f GB", $4)}')"
SPACE_ROOT="$(df -m /root | grep -v block |  awk '{printf("%.2f MB", $2)}')"
SPACE_ROOT_USED="$(df -m /root | grep -v block |  awk '{printf("%.2f MB", $3)}')"
SPACE_ROOT_FREE="$(df -m /root | grep -v block |  awk '{printf("%.2f MB", $4)}')"
}

echo_data() {
    echo 
    printf "${colors[$1]}${font[$2]}HOSTNAME$CL = ${colors[$3]}${font[$4]}$HOSTNAME${CL}\n"
    printf "${colors[$1]}${font[$2]}TIMEZONE$CL = ${colors[$3]}${font[$4]}$TIMEZONE${CL}\n"
    printf "${colors[$1]}${font[$2]}USER$CL = ${colors[$3]}${font[$4]}$USERNAME${CL}\n"
    printf "${colors[$1]}${font[$2]}OS$CL = ${colors[$3]}${font[$4]}$OS${CL}\n"
    printf "${colors[$1]}${font[$2]}DATE$CL = ${colors[$3]}${font[$4]}$DATE${CL}\n"
    printf "${colors[$1]}${font[$2]}UPTIME$CL = ${colors[$3]}${font[$4]}$UPTIME${CL}\n"
    printf "${colors[$1]}${font[$2]}UPTIME_SEC$CL = ${colors[$3]}${font[$4]}$UPTIME_SEC${CL}\n"
    printf "${colors[$1]}${font[$2]}IP$CL = ${colors[$3]}${font[$4]}$IP${CL}\n"
    printf "${colors[$1]}${font[$2]}MASK$CL = ${colors[$3]}${font[$4]}$MASK${CL}\n"
    printf "${colors[$1]}${font[$2]}GATEWAY$CL = ${colors[$3]}${font[$4]}$GATEWAY${CL}\n"
    printf "${colors[$1]}${font[$2]}RAM_TOTAL$CL = ${colors[$3]}${font[$4]}$RAM_TOTAL${CL}\n"
    printf "${colors[$1]}${font[$2]}RAM_USED$CL = ${colors[$3]}${font[$4]}$RAM_USED${CL}\n"
    printf "${colors[$1]}${font[$2]}RAM_FREE$CL = ${colors[$3]}${font[$4]}$RAM_FREE${CL}\n"
    printf "${colors[$1]}${font[$2]}SPACE_ROOT$CL = ${colors[$3]}${font[$4]}$SPACE_ROOT${CL}\n"
    printf "${colors[$1]}${font[$2]}SPACE_ROOT_USED$CL = ${colors[$3]}${font[$4]}$SPACE_ROOT_USED${CL}\n"
    printf "${colors[$1]}${font[$2]}SPACE_ROOT_FREE$CL = ${colors[$3]}${font[$4]}$SPACE_ROOT_FREE${CL}\n" 
}
