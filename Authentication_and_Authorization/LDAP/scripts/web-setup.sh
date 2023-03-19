#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
sudo apt-get update
sudo apt-get install -y apache2 libapache2-mod-authnz-external libapache2-mod-authnz-ldap php-ldap
sudo cp /vagrant/000-default.conf /etc/apache2/sites-available/
sudo systemctl enable apache2
sudo systemctl start apache2

# Enable modules
sudo a2enmod authnz_ldap ldap authnz_external

# Configure LDAP authentication
sudo cp /vagrant/ldap.conf /etc/apache2/
sudo chown root:root /etc/apache2/ldap.conf
sudo chmod 644 /etc/apache2/ldap.conf
sudo cp /vagrant/ldap-auth /etc/pam.d/
sudo chown root:root /etc/pam.d/ldap-auth
sudo chmod 644 /etc/pam.d/ldap-auth
sudo cp /vagrant/authnz_external.conf /etc/apache2/mods-available/
sudo chown root:root /etc/apache2/mods-available/authnz_external.conf
sudo chmod 644 /etc/apache2/mods-available/authnz_external.conf
sudo a2enmod authnz_external
sudo systemctl restart apache2
