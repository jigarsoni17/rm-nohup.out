#!/bin/bash

date=$(date +%d-%m-%y)
mkdir ~/nohupfiles
ip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`


for i in $(find /home/*/*/nohup.out -type f -size +3G )
do
    if [[ -z "$i" ]]    
    then
        echo "Zaveri" 
    else

        name=$(find /home/*/*/nohup.out -type f -size +3G | head -1 | awk -F / '{ print $4; }')
        mv $i $i-$date-$name;         

    fi 
done

mv $(find /home/*/*/nohup.out* -type f -size +3G) ~/nohupfiles/

sh service restart command

aws s3 cp ~/nohupfiles s3://admin-panel-logs/$ip/
