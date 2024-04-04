#!/bin/bash

. helpers.sh

get_data
echo_data

echo
read -p "Would you like to save this information to a file? [Y/N]" save
if [[ $save =~ [Yy] ]]
then
    echo_data >> $(date '+%d_%m_%y_%H_%M_%S').status
fi