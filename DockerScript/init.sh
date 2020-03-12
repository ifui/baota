#!/bin/bash
set -eux

Main()
{
    Remove_File
    Ln_File
    Init

    /etc/init.d/bt default
}

Remove_File()
{
    /www/data/bin/mv /usr/bin /usr/bin_backup
    /www/data/bin/mv /etc/rc.d/init.d /etc/rc.d/init.d_backup
}

Ln_File()
{
    /www/data/bin/ln -s /www/data/bin /usr
    /www/data/bin/ln -s /www/data/init.d /etc/rc.d
}

Init()
{
    cd /etc/init.d
    for i in `ls`
    do
    if [ -x $i ]; then
        ./$i start
    fi
    done
}

Main
/bin/bash