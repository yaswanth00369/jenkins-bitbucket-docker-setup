#!/bin/bash

set -e

echo "🔄 Updating system packages..."
sudo yum update -y

echo "🐳 Installing Docker..."
sudo yum install -y docker

echo "🚀 Starting and enabling Docker..."
sudo systemctl enable docker
sudo systemctl start docker

echo "👤 Adding ec2-user to docker group..."
sudo usermod -aG docker ec2-user

echo "📦 Pulling Jenkins LTS image..."
sudo docker pull jenkins/jenkins:lts


echo "📦 Pulling Bitbucket Latest image..."
sudo docker pull atlassian/bitbucket:latest

echo "📂 Running Jenkins container..."
sudo docker run -dit \
  --name jenkins \
  -p 8080:8080 -p 50000:50000 \
  -v jenkins_home:/var/jenkins_home \
  --restart=always \
  jenkins/jenkins:lts

echo "⏳ Waiting 60 seconds for Jenkins to initialize..."
sleep 60


echo "📂 Running  Bitbucket container..."
sudo docker run -dit \
  --name bitbucket \
  -p 7990:7990 -p 7999:7999 \
  -v bitbucket_home:/var/atlassian/application-data/bitbucket \
  --restart=always \
  atlassian/bitbucket


echo "⏳ Waiting 60 seconds for Bitbucket to initialize..."
sleep 60


# Get public IP
PUBLIC_IP=$(curl -s ifconfig.io)

# Print Jenkins details
echo -e "\e[32m🚀 Jenkins URL: http://$PUBLIC_IP:8080\e[0m"
echo -e "\e[32m🔐 Jenkins Initial Admin Password: $(sudo docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword)\e[0m"

# Print Bitbucket details
echo -e "\e[34m📘 Bitbucket URL: http://$PUBLIC_IP:7990\e[0m"