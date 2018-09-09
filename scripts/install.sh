#!/usr/bin/env bash

sudo yum -y update

sudo yum install epel-release -y

yum groupinstall -y development

yum install -y zlib-dev openssl-devel sqlite-devel bzip2-devel

sudo yum -y install python-pip

sudo pip install --upgrade pip

sudo pip install awscli

#Install Packer
wget https://releases.hashicorp.com/packer/1.2.5/packer_1.2.5_linux_amd64.zip
unzip packer_1.2.5_linux_amd64.zip
sudo mv packer /usr/local/bin

sudo yum install ansible -y

curl -O https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_amd64.zip
sudo unzip -o terraform_0.11.7_linux_amd64.zip -d /usr/bin
