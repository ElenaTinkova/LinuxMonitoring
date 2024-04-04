#!/bin/bash

start=`date +%s`

if [[ $# -ne 1 || ${1: -1} != "/" ]]; then echo "Invalid input"; exit 1; fi
if [[ ! -d $1 ]]; then echo "No such directory"; exit 1; fi

echo
echo  "Total number of folders (including all nested ones) = ""$(find $1 -type d | wc -l | tr -d ' ')"

echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
du -h -d 1 $1 | sort -hr | head -n 5 | awk '{printf "%d - %s, %s\n", NR, $2, $1}'
echo "Total number of files = ""$(find $1 -type f | wc -l | tr -d ' ')"
echo
echo "Number of:"
echo "Configuration files (with the .conf extension) = ""$(find $1 -type f -name "*.conf" | wc -l | tr -d ' ')"
echo "Text files = ""$(find $1 -type f -name "*.txt" | wc -l | tr -d ' ')"
echo "Executable files = ""$(find $1 -type f -executable | wc -l | tr -d ' ')"
echo "Log files (with the extension .log) = ""$(find $1 -type f -name "*.log" | wc -l | tr -d ' ')"
echo "Archive files = ""$(find $1 -type f -name "*.zip" -o -name "*.tar" -o -name "*.gz" | wc -l | tr -d ' ')"
echo "Symbolic links = ""$(find $1 -type l -ls | wc -l | tr -d ' ')"
echo
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):" 
echo "$(find $1 -type f -exec du -ah {} + | sort -rh | head | awk '{printf "%d - %s, %s\n", NR, $2, $1}')"
echo 
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
find $1 -type f -executable -exec du -h {} + | sort -hr | head > info.tmp
awk '{system("md5sum " $2)}' info.tmp | awk '{print $1}' > hashes.tmp
awk '{printf "%d - %s, %s, \n", NR, $2, $1}' info.tmp > info_style.tmp
paste -d " " info_style.tmp hashes.tmp | awk '{print $0; $6=$1; $1=""}'
rm info.tmp info_style.tmp hashes.tmp
echo
end=`date +%s`
runtime=$((end-start))
echo "Script execution time (in seconds) = $runtime"

