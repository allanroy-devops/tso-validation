# TSO-Validation for linux and windows

Run this first,

This will check if extra repository is installed in redhat7/centos7.  Also install software sshpass, git and ansible.
```
sudo curl https://raw.githubusercontent.com/venerari/tso-validation/master/run-1.sh | /bin/bash
```

Run this,

```
git clone https://github.com/tso-ansible/tso-validation.git
cd tso-validation
```

***Linux Preparation***

Run this to copy the ssh public key to the clients.<br>
Create the sshcopy script to run to all the client, make sure input.csv already exist.<br>

```
curl https://raw.githubusercontent.com/venerari/tso-validation/master/run-2.sh | /bin/bash
```

Then setup this to all server and create two sessions (the second session is a backup),
```
sudo su -
(put your password)
cp /etc/sudoers /etc/sudoers.bak
sed -i 's/^#\s*\(%wheel\s*ALL=(ALL)\s*NOPASSWD:\s*ALL\)/\1/' /etc/sudoers
usermod -aG wheel user1@domain.ext
*if you corrupt the sudoers file, restore it with the backup, also if you hang your current session,
*the other sessions should still work.
```

Test linux client connectivity,

```
ansible all -i linux -m ping
**output should all be sucessfull
```

Generate the input.csv file, see the example input.csv and put it in the current folder.

Generate the linux data from remote hosts and validate,
```
curl https://raw.githubusercontent.com/venerari/tso-validation/master/validate-linux.sh | /bin/bash
```

#Copy the output.csv.

***Windows Binary Dependencies:***

yum -y install python-devel krb5-devel krb5-libs krb5-workstation<br>
yum group install "Development Tools"<br>
pip install pywinrm[kerberos]<br>

Edit /etc/krb5.conf according to your AD info,

[realms]<br>
 MY.DOMAIN.COM = {<br>
  kdc = domain-controller1.my.domain.com<br>
  kdc = domain-controller2.my.domain.com<br>
 }<br>
 
 [domain_realm]<br>
    .my.domain.com = MY.DOMAIN.COM<br>

***Preparation for Windows Connection:***

```
kinit user1@DOMAIN.EXT
Password for user1@DOMAIN.EXT: your_password_here
ansible all -i wins -m win_ping
**output should all be sucessfull
```

Generate the input.csv file, see the example input.csv and put it in the current folder.

Generate the windows data from remote hosts and validate,
```
curl https://raw.githubusercontent.com/venerari/tso-validation/master/validate-windows.sh | /bin/bash
```

#Copy the output.csv.
