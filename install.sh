#!/bin/bash

param1_source=$1
param2_target=$2

function func_install() {
	filename=${param1_source##*/}
	case $param2_target in
		''|'-local')
			param2_target="/usr/local/bin/${filename}"
		;;
		*) ;;
	esac
	targetdir=${param2_target%/*}
	if [ ! -d ${targetdir} ];then
		mkdir ${targetdir}
	fi
	printf "> 请输入本机用户密码以安装脚本 "
	sudo mv ${param1_source} ${param2_target} && chmod 777 ${param2_target}
}

case $param1_source in
	'') printf "\n> \033[31m缺少参数！\033[0m 参数：[源文件(包含文件名)] [安装路径(包含文件名)]\n\n" ;;
	*) func_install ;;
esac
