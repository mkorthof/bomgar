# Bomgar
Bomgar PAM

Automated Jump Client installation and removal

## scripts
Tested on Ubuntu (14.04, 16.04) and CentOS 7, should also work on Debian/RH.

#### bomjc.sh
Installs jumpclient binary to /opt/bomgar
User and path can be configured with vars in script

* adds user + runs as user "bomgar"
* creates init script and symlinks 
* starts client

#### bomjc-rm.sh
Uninstalls jumpclient and removes user, dir and init script
