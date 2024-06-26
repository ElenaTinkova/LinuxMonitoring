#!/bin/bash

error="Invalid input"

# Проверка на наличие только одного аргумента
if [ ! $# -eq 1 ]
then
    echo "$error"
else
    if [[ $1 =~ ^[a-zA-Z]+$ ]]
    then
        echo "$1"
    else
        echo "$error"
    fi
fi

# С помощью регулярного выражения проверяем, что аргумент_1 от начала и до конца 
# состоит из латинских букв, которые могут повторяться
# В иных случаях выводится сообщение об ошибке