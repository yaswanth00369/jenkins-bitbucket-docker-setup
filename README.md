# Jenkins & Bitbucket Setup using Docker

This repository contains a Bash script to install Docker and run Jenkins and Bitbucket containers on an Amazon Linux 2023 EC2 instance.

## 🚀 Features

- Installs Docker
- Starts Docker and enables it on boot
- Adds `ec2-user` to the Docker group
- Pulls latest Jenkins (LTS) and Bitbucket images
- Runs Jenkins and Bitbucket in detached mode with persistent Docker volumes
- Prints access URLs and Jenkins initial admin password

---

## 📦 Requirements

- Amazon Linux 2023 EC2 instance
- Root privileges or `sudo` access

---

## 🔧 Usage

1. Clone the repository:

```bash
sudo git clone https://github.com/yaswanth00369/jenkins-bitbucket-docker-setup.git
cd jenkins-bitbucket-docker-setup
```

2. Make sure it’s executable:

```bash
sudo chmod +x Docker-Jenkins-BitBucket.sh
```

3. Run the script:

```bash
sudo ./Docker-Jenkins-BitBucket.sh
```
---

## 🌐 Access URLs

Jenkins: http://<EC2-PUBLIC-IP>:8080

Bitbucket: http://<EC2-PUBLIC-IP>:7990

**Note**: Jenkins initial password is displayed after installation.
