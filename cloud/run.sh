#!/bin/bash
echo "Building..."
go build
sudo rm -rf config/*
cp /shendu/etc/default.toml /shendu/etc/infant.toml config
mkdir config/sql
cp /shendu/etc/sql/readonly.json config/sql
sudo docker build -t usercenter .
containers=($(sudo docker ps -a | awk '{print $2}'))
containerids=($(sudo docker ps -a | awk '{print $1}'))
len_containers=${#containers[@]}
for (( i=1; i<${len_containers}; i++ ));
do
    echo "container id => ${containerids[$i]}, container => ${containers[$i]}"
    if (( "${containers[$i]}" == "usercenter" )); then
        echo "Container usercenter already exists, it will be deleted."
        sudo docker stop ${containerids[$i]}
        sudo docker rm --force ${containerids[$i]}
    fi
done
# The port to run the app.
port=8110
sudo kill -9 $(sudo lsof -t -i:$port)
echo "Run docker image..."
sudo docker run -t -p $port:$port usercenter -name usercenter
