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
sudo su -<br>
(put your password)
cp /etc/sudoers /etc/sudoers.bak<br>
sed -i 's/^#\s*\(%wheel\s*ALL=(ALL)\s*NOPASSWD:\s*ALL\)/\1/' /etc/sudoers<br>
usermod -aG wheel user1@domain.ext<br>
***if you corrupt the sudoers file, restore it with the backup, also if you hang your current session,***
***the other sessions should still work.***
```

Test linux client connectivity,

```
ansible all -i linux -m ping
```

Generate the input.csv file, see the example on the current folder and put it in your 

Generate the linux data from remote hosts and validate,
```
curl https://raw.githubusercontent.com/venerari/tso-validation/master/validate-linux.sh | /bin/bash
```

#Copy the output.csv.


***Windows Preparation***



***Dependencies:***

yum -y install python-devel krb5-devel krb5-libs krb5-workstation<br>
yum group install "Development Tools"<br>
pip install pywinrm[kerberos]<br>

***Preparation for Windows Connection:***

$ kinit user1@DOMAIN.EXT<br>
$ Password for user1@DOMAIN.EXT: your_password_here<br>
$ ansible all -i wins -m win_ping<br>

Generate the windows data from remote hosts and validate,
```
curl https://raw.githubusercontent.com/venerari/tso-validation/master/validate-windows.sh | /bin/bash
```

#Copy the output.csv and check.
