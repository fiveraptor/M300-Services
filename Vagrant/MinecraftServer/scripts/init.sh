#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get -y install screen wget ufw -y
sudo ufw allow 25565/tcp
sudo ufw allow from 10.0.2.2 to any port 22
sudo ufw --force enable

cd /home/vagrant
wget https://download.java.net/java/GA/jdk17.0.2/dfd4a8d0985749f896bed50d7138ee7f/8/GPL/openjdk-17.0.2_linux-x64_bin.tar.gz
tar xvf openjdk-17.0.2_linux-x64_bin.tar.gz
sudo mv jdk-17.0.2/ /opt/jdk-17/
echo 'export JAVA_HOME=/opt/jdk-17' | sudo tee /etc/profile.d/java17.sh
echo 'export PATH=$JAVA_HOME/bin:$PATH'|sudo tee -a /etc/profile.d/java17.sh
source /etc/profile.d/java17.sh