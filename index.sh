#!/bin/sh

NAME=$1
BRANCHE=$2

case $NAME in
  '')
    clear
    printf "欢迎使用 cloud-shell 轻量级云端脚本库！\n"
    printf "文档: https://xaoxuu.com/wiki/cloud-shell/\n"
    printf "默认安装 main 分支最新版本，可以在脚本后面加上分支名或版本号，用空格隔开。例如:\n"
    printf "curl -s https://sh.xaox.cc/install | sh -s \033[32m%s\033[0m \033[34m%s\033[0m\n" "blog" "main"
  ;;
  *) 
    if [ "$BRANCHE" = "" ];then
      BRANCHE='main'
    fi
    source_url=https://sh.xaox.cc/run/${NAME}/${BRANCHE}/index.sh
    echo '> connecting...'
    curl -s ${source_url} | sh -s ${BRANCHE} || printf "\n> \033[31m下载失败！\033[0m\n\n"
  ;;
esac