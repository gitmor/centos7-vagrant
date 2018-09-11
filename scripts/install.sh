#!/usr/bin/env bash

sudo yum -y update

sudo yum install epel-release -y

sudo yum groupinstall -y development

sudo yum install -y zlib-dev openssl-devel sqlite-devel bzip2-devel

sudo yum -y install python-pip

sudo yum -y install wget

sudo pip install --upgrade pip

sudo pip install awscli

#Install Packer
sudo curl -O https://releases.hashicorp.com/packer/1.2.5/packer_1.2.5_linux_amd64.zip
sudo unzip packer_1.2.5_linux_amd64.zip
sudo mv packer /usr/local/bin

sudo yum install ansible -y

sudo curl -O https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_amd64.zip
sudo unzip -o terraform_0.11.7_linux_amd64.zip -d /usr/bin


sudo mkdir -p /opt/packages/

sudo wget https://github.com/99designs/aws-vault/releases/download/v4.3.0/aws-vault-linux-amd64

sudo mv aws-vault-linux-amd64 /opt/packages/

sudo chmod 755 /opt/packages/aws-vault-linux-amd64

sudo ln -sf /opt/packages/aws-vault-linux-amd64 /bin/aws-vault


mkdir -p /home/vagrant/.aws

cp -rf /vagrant/config /home/vagrant/.aws

cp -rf /vagrant/credentials /home/vagrant/.aws

echo "alias tfw='aws-vault exec wawa-iac-training --backend=file -- terraform'" > /home/vagrant/.alias

echo "alias ec2desc='aws ec2 describe-instances --profile wawa-iac-training'" >> /home/vagrant/.alias

source /home/vagrant/.alias
