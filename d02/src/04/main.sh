#!/bin/bash

. color_config.conf
. scheme.sh
. data_info.sh

if [[ $# -ne 0 ]]
then
    echo "This script doesn't support arguments"
    exit 1
fi


error="Edit the color_config.conf and run the script again"
flag=0

while IFS= read -r line; do
    arg=$(echo "$line" | cut -d'=' -f2 | tr -d ' ')
    if [[ $arg = "" ]]; then flag=1; fi
done < color_config.conf

if [[ $flag = 1 ]]
then
    if [[ -z $column1_background ]]; then column1_background=1; default_p1=1; fi
    if [[ -z $column1_font_color ]]; then column1_font_color=6; default_p2=1; fi
    if [[ -z $column2_background ]]; then column2_background=5; default_p3=1; fi
    if [[ -z $column2_font_color ]]; then column2_font_color=6; default_p4=1; fi
fi


vars="$column1_background $column1_font_color $column2_background $column2_font_color"

for var in $vars
do
    if ! [[ $var =~ ^[1-6]$ ]]
    then
        echo "All parameters must be numbers between 1 and 6"
        echo "$error"
        exit 1
    fi
done


if [[ $column1_background -eq $column1_font_color  || $column2_background -eq $column2_font_color ]]
then
    echo "Background and font color must not be the same"
    echo "$error"
    exit 1
fi

get_data
echo_data $vars
echo
echo_default $vars
