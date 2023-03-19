#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
sudo apt-get update
sudo dpkg --configure -a
sudo apt-get install -y slapd ldap-utils

