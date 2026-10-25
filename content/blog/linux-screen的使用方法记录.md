+++
title = "linux screen的使用方法记录"
date = 2022-06-14T10:50:27+08:00
path = "2022/06/14/linux-screen的使用方法记录"
description = "查看会话列表： screen ls 新建一个会话并进入 screen S <session 要回到某个会话，可执行下列命令 screen r <session 前提是此会话已被detacth，若没有则执行screen d"
[taxonomies]
categories = ["技术教程"]
+++

- 查看会话列表：

`screen -ls`

- 新建一个会话并进入

`screen -S <session>`

- 要回到某个会话，可执行下列命令

`screen -r <session>`

前提是此会话已被detacth，若没有则执行`screen -d <session>`，再执行上述命令。

执行命令后，则已attach这个会话，通过`ctrl + a + d`可以离开这个会话

- 要杀死某个会话

`screen -S <session-id> -X quit`

只需填入要杀死的会话id，使用名称也可
