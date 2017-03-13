#!/bin/sh

bomdir=/opt/bomgar

if [ $( id -u ) -eq 0 ]; then
  $bomdir/init-script stop
  { echo y | $bomdir/uninstall && userdel -r bomgar && rm -rf $bomdir && rm /etc/init.d/bomgar; } && echo Bomgar Jump Client was removed
  which update-rc.d >/dev/null 2>&1 && update-rc.d bomgar remove
  which chkconfig >/dev/null 2>&1 && chkconfig --del bomgar
else
  echo Run $0 as root user
fi
