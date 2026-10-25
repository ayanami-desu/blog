+++
title = "windows端使用python解压rar文件"
date = 2023-06-05T23:45:34+08:00
path = "2023/06/05/windows端使用python解压rar文件"
description = "首先吐槽网上的所有教程，全都是错的。连带也污染了chatgpt的回答，也是错的。中文互联网的内容已经垃圾到这种地步了。 如果是zip文件，python的内置库就可以搞定。但是rar文件则需要使用pip来安装rarfile"
[taxonomies]
categories = ["技术教程"]
tags = ["python", "unrar", "windows"]
+++

首先吐槽网上的所有教程，全都是错的。连带也污染了chatgpt的回答，也是错的。中文互联网的内容已经垃圾到这种地步了。

如果是zip文件，python的内置库就可以搞定。但是rar文件则需要使用pip来安装rarfile

`pip install rarfile`

然后还需要一个用于解压的程序，这里使用winrar安装目录下的unrar.exe。

[unrar](/wp-content/uploads/2023/06/unrar.zip)[下载](/wp-content/uploads/2023/06/unrar.zip)

解压后放到python安装目录下的Scripts中

最后就是按下面的步骤来解压rar文件

```
# 构建RAR文件的完整路径
rar_file = os.path.join(directory, filename)
#创建文件对象
f = open(rar_file, 'rb')
# 创建一个RarFile对象
rar_ref = rarfile.RarFile(f, charset='utf-8')
# 提取RAR文件中的所有文件
rar_ref.extractall(temp_dir)
# 关闭RarFile对象
rar_ref.close()
# 关闭文件
f.close()
# 删除原文件
os.remove(rar_file)
```
