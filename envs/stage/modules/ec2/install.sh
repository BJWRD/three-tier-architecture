#!/bin/bash
#VM Startup Script
sudo yum update -y
sudo amazon-linux-extras install docker -y
sudo systemctl enable docker --now
sudo systemctl enable containerd.service --now
sudo usermod -a -G docker ec2-user
sudo docker pull bjwrd/app.py
sudo docker run -d bjwrd/app.py 
