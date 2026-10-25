+++
title = "N1 openwrt固件开启samba方法"
date = 2022-05-18T19:22:49+08:00
path = "2022/05/18/n1-openwrt固件开启samba方法"
description = "1、设置共享用户密码 刚开始口令文件是不存在的，先touch，再增加一个用户，ssh输入以下命令： touch /etc/samba/smbpasswd smbpasswd a root 然后输两遍要设置的SMB密码 2"
[taxonomies]
categories = ["技术教程"]
+++

### 1、设置共享用户密码

刚开始口令文件是不存在的，先touch，再增加一个用户，ssh输入以下命令：  
touch /etc/samba/smbpasswd  
smbpasswd  -a root  
然后输两遍要设置的SMB密码

### 2、修改samba模板，启用root用户访问。

在invalidusers = root前加#  
下面的允许用户填root，目录填你的共享目录的路径，只读和允许匿名不要勾选，后面的权限保持默认的0666和0777

### 3、重启N1或启动项里重启samba4

> <https://www.right.com.cn/forum/thread-4044786-1-1.html>
>
> 来自恩山论坛
