#!/bin/bash

date=$(date +%d-%m-%y)
mkdir ~/nohupfiles
ip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`


for i in $(find /home/*/*/nohup.out -type f -size +3G )
do

    name=$(find /home/*/*/nohup.out -type f -size +3G | head -1 | awk -F / '{ print $4; }')
    mv $i $i-$date-$name;
    c=$( echo $i | cut -d/ -f1-4 )  
    sh $c/start.sh
done 

mv $(find /home/*/*/nohup.out* -type f -size +3G) ~/nohupfiles/

aws s3 cp ~/nohupfiles/*  s3://admin-panel-logs/$ip/
