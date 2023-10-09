#!/bin/bash

# 变量区
name=jiaoyifan
port=2802

# 开启新的container
docker run --gpus '"device=0,1,2,3,4,5,6,7"' -it -p $port:22 --name $name \
    -v /data_nfs/jyf:/data1 -v /data1/jiaoyifan:/data \
    nvcr.io/nvidia/pytorch:21.02-py3

# docker start $name
# docker container update --restart=always $name

