#!/bin/bash

#Check extra repository
rpm -qa epel-release > x
if [[ ! -s x ]]; then
   sudo wget https://archive.fedoraproject.org/pub/epel/7Server/x86_64/Packages/e/epel-release-7-11.noarch.rpm
   sudo rpm -ivh epel-release-7-11.noarch.rpm
   sudo yum install git ansible sshpass -y
fi
