#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
Main()
{
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