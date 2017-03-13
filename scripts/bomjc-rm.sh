#!/bin/sh

bomdir=/opt/bomgar

$bomdir/init-script stop
{ echo y | $bomdir/uninstall && userdel -r bomgar && rm -rf $bomdir && rm /etc/init.d/bomgar } && echo Bomgar Jump Client was removed
[ $( which update-rc.d ) ] && update-rc.d bomgar remove
[ $( which chkconfig) ] && chkconfig --del bomgar
