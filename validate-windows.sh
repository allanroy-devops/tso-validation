#!/bin/bash

#create wins
awk -F',' 'FNR > 1 { print  $1 }' input.csv > temp
#remove empty lines
echo [windows] > wins
awk NF temp >> wins
echo >> wins
echo [windows:vars] >> wins
echo ansible_user=$(whoami) | awk -F "@" '{ print $1,"@",toupper($2)}' | tr -d " " >> wins
echo ansible_password= >> wins
echo ansible_connection=winrm >> wins
echo ansible_winrm_transport=kerberos >> wins
echo ansible_port=5985 >> wins
echo ansible_winrm_kinit_mode=manual >> wins

chmod u+x create-loop.py
./create-loop.py input.csv
mv server.yml roles/validate-windows/vars/

ansible-playbook -i wins validate-windows.yml
