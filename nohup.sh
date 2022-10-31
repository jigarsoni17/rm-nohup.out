#!/bin/bash

date=$(date +%d-%m-%y)


for i in $(find /home/*/*/nohup.out -type f -size +3G | head -1)
do
    if [[ -z "$i" ]]    
    then
    name=$(find /home/*/*/nohup.out -type f -size +3G | head -1 | awk -F / '{ print $4; }')
    mv $i $i-$date-$name;
    else
        break   
     
    fi 

done
 
 
 
 
 

