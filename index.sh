#!/bin/bash

# 下载什么
NAME=$1
# 哪个版本
BRANCHE=$2

# 其它参数
P3=$3
P4=$4

function on_fail() {
	NAME=""
	BRANCHE=""
	printf "\n> \033[31m下载失败！\033[0m\n\n"
}

function start() {
	if [ "$BRANCHE" == "" ];then
		BRANCHE='main'
	fi
	source_url=https://sh.xaox.cc/run/${NAME}/${BRANCHE}/index.sh
	printf '\n> 正在请求下载 %s\n' ${source_url}
	curl -s ${source_url} | sh -s ${P3} ${P4} || on_fail
}

function check_param() {
		case $NAME in
			'')
				clear
				printf "可安装的脚本:\n"
				printf "  \033[1m\033[32m%s\033[0m %s (docs: %s) \n" 'blog   ' '' 'https://xaoxuu.com/wiki/cloud-shell/blog/'
				printf "  \033[1m\033[32m%s\033[0m %s (docs: %s) \n" 'vimcn  ' '' 'https://xaoxuu.com/wiki/cloud-shell/vimcn/'
				printf "  \033[1m\033[32m%s\033[0m %s (docs: %s) \n" 'tag    ' '' 'https://xaoxuu.com/wiki/cloud-shell/tag/'
				printf "  \033[1m\033[32m%s\033[0m %s (docs: %s) \n" 'podspec' '' 'https://xaoxuu.com/wiki/cloud-shell/podspec/'
				printf "\n"
				printf "默认安装最新版本，可以在脚本后面加上版本号安装指定版本或分支，用空格隔开。例如:\n"
				printf "curl -s https://sh.xaox.cc/install | bash -s blog 3.0.0\n"
				printf "\n"
			;;
			*) start ;;
		esac
}

check_param
