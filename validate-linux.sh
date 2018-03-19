 
#!/bin/bash

#create hosts
awk -F',' 'FNR > 1 { print  $1 }' input.csv > temp
#remove empty lines
awk NF temp > linux
chmod u+x create-loop.py
chmod u+x validate.py
./create-loop.py input.csv
mv server.yml roles/validate-linux/vars/
ansible-playbook -i linux validate-linux.yml
