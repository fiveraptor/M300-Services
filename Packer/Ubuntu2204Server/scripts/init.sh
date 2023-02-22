#!/bin/bash -eux

# Add vagrant user to sudoers.
echo "vagrant        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

# Disable daily apt unattended updates.
echo 'APT::Periodic::Enable "0";' >> /etc/apt/apt.conf.d/10periodic

# Update the package list and upgrade the installed packages
sudo apt update
sudo apt upgrade -y

# Install Apache2
sudo apt install apache2 -y

# Configure Apache2
sudo ufw allow in "Apache Full"
sudo systemctl enable apache2
sudo systemctl start apache2