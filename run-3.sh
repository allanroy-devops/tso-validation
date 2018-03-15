 
#!/bin/bash

#create hosts
awk -F',' 'FNR > 1 { print  $1 }' input.csv > temp
#remove empty lines
awk NF temp > hosts
chmod u+x create-loop.py
./create-loop.py input.csv
cp server.yml roles/validate-linux/vars/
ansible-playbook -i hosts validate-linux.yml
awk '{print "cp /tmp/"$1"_fetched/"$1"/tmp/"$1"_output.csv out"}' hosts > cp-csv
chmod u+x  cp-csv
./cp-csv
chmod u+x  out/validate.py
python out/validate.py
