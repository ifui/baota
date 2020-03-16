#!/bin/sh
# 宝塔面板数据导入脚本
set -e
EXPORT_PATH='/app_backup/export'
IMPORT_PATH='/app_backup'
cd $EXPORT_PATH

Menu()
{
cat << EOF
宝塔面板数据迁移
`Menu_List`

EOF
read -p "请选择需要迁移的数据包：" num
Menu_Case $num

}

Menu_List()
{
    n=0
    for i in `ls $EXPORT_PATH`;
    do
        let n++
        echo -e "${n})\033[35m ${i}\033[0m"
    done
}

Menu_Case()
{
    if [[echo $1 | grep -q '[^0-9]']] || [[ $1 != 0 ]];
    then
        echo -e "\e[31m请输入正确的数字选项！\e[0m"
        exit 1
    fi
    file="$(($1+1))p"
    FILENAME=`ls -l $EXPORT_PATH | sed -n $file | awk '{print $9}'`
    if [ ! -f $FILENAME ];
    then
        echo -e "\e[31m文件不存在！\e[0m"
        exit 1
    fi
    tar -zxvpf $FILENAME -C $IMPORT_PATH
    echo  -e "\033[32m数据迁移成功!\033[0m"
}

Menu