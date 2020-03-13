#!/bin/bash
PATH=/www/data/usr/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
Main()
{
    Move_Ln_File /usr/bin
    Move_Ln_File /etc/rc.d/init.d
    Move_Ln_File /usr/local
    Init

    /etc/init.d/bt default
}

Move_Ln_File()
{
    mv $1 $1_backup
    ln -s /www/data$1 $1
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