#!/bin/sh

bomusr=bomgar
bomdir=/opt/bomgar
bombin=$( ls -1t bomgar-pec*.bin 2>/dev/null | head -1 )
binitd=/etc/init.d/bomgar

if [ $( id -u ) -eq 0 ]; then
  id -u $bomusr >/dev/null 2>&1 || useradd -d $bomdir -c jumpclient $bomusr
  [ -d $bomdir ] && { rmdir $bomdir >/dev/null 2>&1 && echo "Removed $bomdir" || echo "Could not remove $bomdir"; }
  { [ ! -z $bombin ] && chmod +x $bombin >/dev/null 2>&1; } && ./$bombin --install-dir $bomdir --user $bomusr || { echo Cannot start installer, exiting; exit 1; }
  { [ -f $bomdir/init-script ] && [ ! -f $binitd ]; } && { ln -s $bomdir/init-script $binitd && echo Created symlink for init script: $( stat -c %N $binitd ); }
  [ $( which update-rc.d ) ] && update-rc.d bomgar start 20 2 3 4 5 . stop 20 0 1 6 .
  [ $( which chkconfig ) ] && chkconfig --add bomgar
  $bomdir/init-script start && echo Bomgar Jump Client was started successfully
else
  echo Run $0 as root user
fi
