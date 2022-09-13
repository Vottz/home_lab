#!/bin/bash

echo "Installing..."

# Installing Kubernetes on Raspbery Pi
#http://tplinkwifi.net
sudo dhclient eth0
sudo vim /boot/firmware/cmdline.txt


sudo reboot


# Install Docker-Engine
#curl -fsSL https://get.docker.com -o get-docker.sh
sudo apt-get update
sudo apt install docker.io

sudo cat > /etc/docker/daemon.json <<EOF
{
“exec-opts”: [“native.cgroupdriver=systemd”],
“log-driver”: “json-file”,
"log=opts": {
},
“storage-driver”: “overlay2”
}
EOF

# Restart docker
sudo systemctl enable docker
sudo systemctl daemon-reload
sudo systemctl restart docker


# Installing Kubelet, Kubectl, & Kubeadm
#https://medium.com/@mrcaspento/how-to-build-a-kubernetes-server-on-a-raspberry-pi-cluster-fa0ffa95c004
