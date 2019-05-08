#!/bin/bash

touch logfile_$(date "+%Y%m%d%T")
IP_FILE="ip_address.txt"
LOGFILE="logfile_$(date "+%Y%m%d%T")"

if [[ ! -f ${IP_FILE} ]]; then
 echo "Cannot find IP address!"
 exit 1
fi

for IP_ADDRESS in `cat $IP_FILE` ; do
  ssh $IP_ADDRESS >> $LOGFILE 2>&1
  #ssh-keyscan $IP_ADDRESS 2>&1 | grep -v "^$" > /dev/null
  [ $? == 0 ] && echo $IP_ADDRESS >> $LOGFILE 2>&1
done
