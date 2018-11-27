#!/bin/bash

param1_repo_name=$1
param2_branch=$2
param3_client_name=$3

function func_download() {
	case $param2_branch in
		'') param2_branch='master' ;;
		*) ;;
	esac
	case $param3_client_name in
		'') param3_client_name=${param1_repo_name} ;;
		*) ;;
	esac
	URL=https://raw.githubusercontent.com/xaoxuu/${param1_repo_name}/${param2_branch}/${param3_client_name}
	echo "> 正在下载: ${URL}"
	curl -f -o $HOME/Downloads/${param3_client_name} ${URL} -#
}


case $param1_repo_name in
	'') printf "\n> \033[31m缺少参数！\033[0m 参数：[GitHub仓库名] [分支] [要下载的文件]\n\n" ;;
	*) func_download ;;
esac
