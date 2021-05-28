#!/bin/bash


applicationName=$1

if [ ! -f "/home/rd/as.sh" ];then
  echo "下载scripts/as.sh"
  wget wget 10.9.118.66:17826/scripts/as.sh
  else
  echo "scripts/as.sh已经存在"
fi

chmod 777 as.sh
echo "项目名: ${applicationName} "

docker cp as.sh  `docker ps | grep ${applicationName} | awk '{printf $1}'`:logs/

docker exec -it  `docker ps | grep ${applicationName} | awk '{printf $1}'` /bin/bash#!/bin/bash