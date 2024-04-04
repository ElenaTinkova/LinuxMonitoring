#!/bin/bash

. data_info.sh

if [[ $# -ne 4 ]]
then
    echo "This script requires four arguments"
    exit 1
fi

for arg in "$@"
do
    if ! [[ $arg =~ ^[1-6]$ ]]
    then
        echo "All arguments must be numbers between 1 and 6"
        exit 1
    fi
done

if [[ $1 -eq $2  || $3 -eq $4 ]]
then
    echo "Background and font color must not be the same"
    echo "Run the script again"
    exit 1
fi

get_data
echo_data $1 $2 $3 $4
