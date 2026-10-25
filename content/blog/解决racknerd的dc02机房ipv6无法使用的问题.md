+++
title = "解决racknerd的dc02机房ipv6无法使用的问题"
date = 2023-02-17T10:57:56+08:00
path = "2023/02/17/解决racknerd的dc02机房ipv6无法使用的问题"
description = "这个问题一般重装之后系统会出现 nano /etc/sysctl.conf 在末尾添加以下内容 net.ipv6.conf.all.autoconf = 0 net.ipv6.conf.all.acceptra = 0 "
[taxonomies]
categories = ["随便说说"]
tags = ["ipv6", "racknerd"]
+++

这个问题一般重装之后系统会出现

```
nano /etc/sysctl.conf
```

在末尾添加以下内容

```
net.ipv6.conf.all.autoconf = 0
net.ipv6.conf.all.accept_ra = 0
net.ipv6.conf.eth0.autoconf = 0
net.ipv6.conf.eth0.accept_ra = 0
```

```
sysctl -p # 检查配置
systemctl restart networking # 重启网络
ping6 google.com
```

> [解决rn的dc2ipv6无法使用问题](https://hostloc.com/forum.php?mod=viewthread&tid=1017493&highlight=rn%2Bipv6)
>
> 转载自全球主机交流论坛
