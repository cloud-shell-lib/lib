# cloud-shell-lib

这是一个公共库，封装了下载和安装脚本的方法。

```
curl -s https://sh.xaox.cc/install | bash -s
```

## 如何使用

在脚本中定义一个常数，指定函数库的版本：

```sh
# lib
lib=https://sh.xaox.cc/lib/v3
```

### 下载脚本

| 参数 | 含义 |
| :-- | :-- |
| ${REPO} | xaoxuu名下的仓库名 |
| ${BRANCHE} | 此仓库的分支 |
| ${TARGET} | 要下载的文件 |
| ${CACHE_PATH} | 保存路径（可选，默认为Downloads） |

```sh
curl -s ${lib}/download.sh | sh -s ${REPO} ${BRANCHE} ${TARGET}
```

> 除了脚本，此方法也可以下载其它文件。

### 安装脚本

| 参数 | 含义 |
| :-- | :-- |
| ${TARGET} | 下载的文件路径 |
| ${RENAME} | 保存的名字（可选，默认同文件名） |

```sh
curl -s ${lib}/install.sh | sh -s ${TARGET} ${RENAME}
```

如果下载路径是默认的，那么路径是： `$HOME/Downloads/${FILENAME}`

```sh
curl -s ${lib}/install.sh | sh -s $HOME/Downloads/${FILENAME} ${RENAME}
```
