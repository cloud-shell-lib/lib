#!/bin/bash

REPO_NAME=$1
REPO_VERSION=$2
CLI_NAME=$3
CACHE_PATH=$4

function func_download() {
	case $REPO_VERSION in
		''|'*') REPO_VERSION='master' ;;
		*) ;;
	esac
	case $CLI_NAME in
		''|'*') CLI_NAME=${REPO_NAME} ;;
		*) ;;
	esac
	source_url=https://cdn.jsdelivr.net/gh/xaoxuu/${REPO_NAME}@${REPO_VERSION}/${CLI_NAME}
	case $CACHE_PATH in
		'') CACHE_PATH=$HOME/Downloads/ ;;
		*) ;;
	esac
	if [ ! -d ${CACHE_PATH} ];then
		mkdir ${CACHE_PATH}
	fi
	echo "> 正在下载: ${source_url}"
	curl -f -o ${CACHE_PATH}/${CLI_NAME} ${source_url} -# &&
	echo "> 下载成功: ${CACHE_PATH%/*}/${CLI_NAME}"
}


case $REPO_NAME in
	'') printf "\n> \033[31m缺少参数！\033[0m 参数：[GitHub仓库名] [分支] [要下载的文件]\n\n" ;;
	*) func_download ;;
esac
