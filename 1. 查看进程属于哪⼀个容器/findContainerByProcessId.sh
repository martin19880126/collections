#!/bin/bash
 
### Usage：
# findContainerByProcessId.sh ${pid}   
#
#
 
if [[ $1 -eq "" ]]; then
    echo "please enter a pid"
    exit
fi
 
allContainer=`sudo docker ps --format '{{ .Names }}'`
for cont in $allContainer; do
 
    pids=$(docker top $cont | awk '{print $2}')
  for pid in $pids; do
    if [[ $1 -eq $pid ]]; then
        echo "process $1 is running in $cont"
        exit 0
    fi
   done
done
echo "cannot find container by pid $1"
