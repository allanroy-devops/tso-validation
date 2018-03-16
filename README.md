# TSO-Validation for linux and windows

***Linux Preparation***

Run this first,

```
sudo curl https://raw.githubusercontent.com/venerari/tso-validation/master/run-1.sh | /bin/bash
```

Create the sshcopy script to run to all the client, make sure input.csv already exist.
```
curl https://raw.githubusercontent.com/venerari/tso-validation/master/run-2.sh | /bin/bash
```

Generate the linux data from remote hosts,
```
curl https://raw.githubusercontent.com/venerari/tso-validation/master/validate-linux.sh | /bin/bash
```

***Windows Inventory:***


[windows]<br>
win2012r2<br>

[windows:vars]<br>
ansible_user=user1@DOMAIN.EXT<br>
ansible_password=<br>
ansible_connection=winrm<br>
ansible_winrm_transport=kerberos<br>
ansible_port=5985<br>
ansible_winrm_kinit_mode=manual

***Dependencies:***

yum -y install python-devel krb5-devel krb5-libs krb5-workstation<br>
yum group install "Development Tools"<br>
pip install pywinrm[kerberos]<br>

***Preparation for Windows Connection:***

$ kinit user1@DOMAIN.EXT<br>
$ Password for user1@DOMAIN.EXT: your_password_here<br>
$ ansible all -i wins -m win_ping<br>

Generate the windows data from remote hosts,
```
curl https://raw.githubusercontent.com/venerari/tso-validation/master/validate-windows.sh | /bin/bash
```

