#!/bin/bash
name=test
port=2802

# 开启新的container
docker run --gpus '"device=0,1,2,3,4,5,6,7"' -p $port:22 --name $name -v /data_nfs/jyf:/data nvcr.io/nvidia/pytorch:21.02-py3

# 让container在docker服务启动时自动启动
docker update --restart=always $name

# 启动指定container
docker start $name
docker exec -it $name bash

