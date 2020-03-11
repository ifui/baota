#!/bin/bash
set -eux
/www/data/bin/mv /usr/bin /usr/bin_backup
/www/data/bin/mv /etc/rc.d/init.d /etc/rc.d/init.d_backup

/www/data/bin/ln -s /www/data/bin /usr
/www/data/bin/ln -s /www/data/init.d /etc/rc.d

bash /www/server/panel/init.sh start
bash /www/server/panel/init.sh default

/bin/bash