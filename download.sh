#!/bin/bash

param1_repo_name=$1
param2_version=$2
param3_client_name=$3
param4_cache_path=$4

function func_download() {
	case $param2_version in
		''|'*') param2_version='master' ;;
		*) ;;
	esac
	case $param3_client_name in
		''|'*') param3_client_name=${param1_repo_name} ;;
		*) ;;
	esac
	source_url=https://raw.githubusercontent.com/xaoxuu/${param1_repo_name}/${param2_version}/${param3_client_name}
	case $param4_cache_path in
		'') param4_cache_path=$HOME/Downloads/ ;;
		*) ;;
	esac
	if [ ! -d ${param4_cache_path} ];then
		mkdir ${param4_cache_path}
	fi
	echo "> 正在下载: ${source_url}"
	curl -f -o ${param4_cache_path}/${param3_client_name} ${source_url} -# &&
	echo "> 下载成功，存放路径为: ${param4_cache_path%/*}/${param3_client_name}"
}


case $param1_repo_name in
	'') printf "\n> \033[31m缺少参数！\033[0m 参数：[GitHub仓库名] [分支] [要下载的文件]\n\n" ;;
	*) func_download ;;
esac
