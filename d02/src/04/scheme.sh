#!/bin/bash

declare -a color_name
color_name[1]="white"
color_name[2]="red"
color_name[3]="green"
color_name[4]="blue"
color_name[5]="purple"
color_name[6]="black"

echo_default() {
    if [[ $default_p1 = 1 ]] 
    then
        echo -e "Column 1 background = default (${color_name[1]})"
    else 
        echo -e "Column 1 background = $1 (${color_name[$1]})"
    fi

    if [[ $default_p2 = 1 ]]
    then 
        echo -e "Column 1 font color = default (${color_name[6]})"
    else
        echo -e "Column 1 font color = $2 (${color_name[$2]})"
    fi

    if [[ $default_p3 = 1 ]] 
    then
        echo -e "Column 2 background = default (${color_name[5]})"
    else 
        echo -e "Column 2 background = $3 (${color_name[$3]})"
    fi

    if [[ $default_p4 = 1 ]] 
    then
        echo -e "Column 2 font color = default (${color_name[6]})"
    else 
        echo -e "Column 2 font color = $4 (${color_name[$4]})"
    fi
}