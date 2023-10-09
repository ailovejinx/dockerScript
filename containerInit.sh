#!/bin/bash

# ======================启动ssh服务======================
apt-get update
apt-get install vim -y
apt-get install openssh-server -y

# 备份原始的 sshd_config 文件
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak

# 使用 sed 命令将 "UsePAM yes" 替换为 "UsePAM no"
sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config
# 使用 sed 命令将 "PermitRootLogin prohibit-password" 替换为 "PermitRootLogin yes"
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config

# 修改密码
password="123"  # 密码默认为123

echo -e "$password\n$password" | passwd root

# 重启 SSH 服务
service ssh restart
echo "ssh restarted"

# 在~/.bashrc里写入ssh start
echo "service ssh start" >> ~/.bashrc
source ~/.bashrc

# ======================安装常用的包======================
apt-get install tmux -y
apt-get install htop -y
apt-get install gpustat -y
apt-get install zsh -y

# echo "start installing anaconda"
# # 安装anaconda
# cd /data
# wget https://repo.anaconda.com/archive/Anaconda3-2023.09-0-Linux-x86_64.sh -O anaconda.sh

# # 定义 Anaconda 安装路径
# ANACONDA_INSTALL_PATH="/data1/anaconda3"

# # 运行 Anaconda 安装脚本
# bash anaconda.sh -b -p "$ANACONDA_INSTALL_PATH"

# # 添加 Anaconda 到环境变量
# echo "export PATH=\"$ANACONDA_INSTALL_PATH/bin:\$PATH\"" >> ~/.bashrc
# source ~/.bashrc

# echo "anaconda installation finished"

# 如果不需要安装新的anaconda，直接写入环境变量
echo "export PATH=\"/data/anaconda3/bin:\$PATH\"" >> ~/.bashrc
source ~/.bashrc
