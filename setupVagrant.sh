#!/bin/bash
echo "Provisioning virtual machine..."
apt-get update
echo "Installing git nano unzip firefox jre jdk"
apt-get install -y git nano unzip firefox default-jre default-jdk
echo "Installing java8"
add-apt-repository ppa:webupd8team/java -y
apt-get update
# enable silent install
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
apt-get install -y oracle-java8-installer
echo "Installing gcloud sdk"
export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
apt-get update
apt-get install google-cloud-sdk
echo "Installing Cloud Foundry CLI"	
dpkg -i /vagrant/cf-cli-installer_6.20.0_x86-64.deb
echo "Get GitHub repositories"
git clone https://github.com/smichard/ScaleioOnGCE.git /vagrant/projects/ScaleioOnGCE
git clone https://github.com/smichard/CloudFoundryDemo.git /vagrant/projects/CloudFoundryDemo
git clone https://github.com/smichard/neutrinoDemo.git /vagrant/projects/neutrinoDemo
