+++
title = "解决关闭docker容器时需要等待10秒的问题"
date = 2023-06-10T20:06:10+08:00
path = "2023/06/10/解决关闭docker容器时需要等待10秒的问题"
description = "首先这个问题的产生有很多可能的原因。启动命令不对，容器内程序未接收停止信号之类。 首先编写dockerfile文件时，启动命令最好是使用CMD\"\\entrypoint.sh\"，然后在entrypoint.sh文件中在程序"
[taxonomies]
categories = ["技术教程"]
tags = ["docker", "容器"]

[extra]
comments = "wp-231"
+++

首先这个问题的产生有很多可能的原因。启动命令不对，容器内程序未接收停止信号之类。

首先编写dockerfile文件时，启动命令最好是使用`CMD["\entrypoint.sh"]`，然后在entrypoint.sh文件中在程序运行的那一行开头加上exec。例如：`exec ./myapp -c config.json`

如果像这样编写的dockerfile文件构建出来的容器关闭时还是要等待10秒的长时间的话，可以尝试在docker启动命令中加上`--init`的参数，docker-compose文件中则是加上`init: true`

```
version: "2.4"
services:
  web:
    image: alpine:latest
    init: true
```

上述方法都不行的话，就直接加上关闭时的的等待时间。

`docker stop -t TIMEOUT` or `docker stop --time TIMEOUT`

```
services:
  service_A:
    ...
    stop_grace_period: 1s  # 1秒后强行关闭
  service_B:
    ...
    stop_grace_period: 5m30s  # 长时间等待后关闭
```
