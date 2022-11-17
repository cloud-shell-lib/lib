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
				printf "  \033[1m\033[32m%s\033[0m %s \t (docs: %s) \n" 'tag.sh' '' 'https://xaoxuu.com/wiki/tag.sh/'
				printf "  \033[1m\033[32m%s\033[0m %s \t (docs: %s) \n" 'hexo.sh' '' 'https://xaoxuu.com/wiki/hexo.sh/'
				printf "  \033[1m\033[32m%s\033[0m %s \t (docs: %s) \n" 'podspec.sh' '' 'https://xaoxuu.com/wiki/podspec.sh/'
				printf "  \033[1m\033[32m%s\033[0m %s \t (docs: %s) \n" 'vim-cn.sh' '' 'https://xaoxuu.com/wiki/vim-cn.sh/'
				printf "\n"
				printf "默认安装最新版本，可以在脚本后面加上版本号安装指定版本或分支，用空格隔开。例如:\n"
				printf "curl -s https://sh.xaox.cc/install | bash -s hexo.sh v2\n"
				printf "\n\n"
			;;
			*) start ;;
		esac
}

check_param