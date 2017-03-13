# Bomgar
Bomgar PAM

## scripts
Tested on Ubuntu (14.04), should also work on Debian/RH/CentOS.

#### bomjc.sh
Install jumpclient binary to /opt/bomgar
* adds + runs as user "bomgar"
* create init script and symlinks 
* starts client
* user and path can be configured with var in script

#### bomjc-rm.sh
Uninsall jumpclient, remove user/dir etc
