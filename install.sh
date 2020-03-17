#!/bin/bash

# 源文件
P1=$1

# 重命名
P2=$2

function func_install() {
	src=$P1
	target_full_path=''
	case $P2 in
		''|'*')
			target_full_path="/usr/local/bin/${src##*/}"
		;;
		*)
			target_full_path="/usr/local/bin/${P2}"
		;;
	esac
	targetdir=${target_full_path%/*}
	if [ ! -d ${targetdir} ];then
		mkdir ${targetdir}
	fi
	printf "> 请输入本机用户密码以安装脚本 "
	sudo mv ${src} ${target_full_path} && chmod 777 ${target_full_path}
}

case $P1 in
	'') printf "\n> \033[31m缺少参数！\033[0m 参数：[源文件(包含文件名)] [安装路径(包含文件名)]\n\n" ;;
	*) func_install ;;
esac
