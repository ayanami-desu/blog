+++
title = "ubuntu上dns管理的相关问题"
date = 2024-08-07T00:17:23+08:00
path = "2024/08/07/ubuntu上dns管理的相关问题"
description = "一，让systemdresolved不使用127.0.0.53 systemdresolved会产出两个运行配置，如下 /run/systemd/resolve/resolv.conf 路径1 /run/systemd/"
[taxonomies]
categories = ["技术教程"]
tags = ["dns", "ubuntu"]

[extra]
comments = "wp-283"
+++

## 一，让systemd-resolved不使用127.0.0.53

`systemd-resolved`会产出两个运行配置，如下

```
/run/systemd/resolve/resolv.conf #路径1
/run/systemd/resolve/stub-resolv.conf #路径2
```

`/etc/resolv.conf` 默认已经软链接到`/run/systemd/resolve/stub-resolv.conf`（路径2），那么只需将`/etc/resolv.conf` 软链接到`/run/systemd/resolve/resolv.conf`（路径1）

而/run/systemd/resolve/* 下的配置文件是由`/etc/systemd/resolved.conf` 决定的，可以用下边的配置脚本，取消指向127.0.0.53，并关闭127.0.0.53的监听。

```
mkdir -p /etc/systemd/resolved.conf.d/
cat >/etc/systemd/resolved.conf.d/99-dns.conf << EOF
[Resolve]
DNS=1.1.1.1 8.8.8.8
DNSStubListener=no
EOF
ln -s -f /run/systemd/resolve/resolv.conf /etc/resolv.conf
systemctl daemon-reload && systemctl restart systemd-resolved.service
cat /etc/resolv.conf
```

## 二，夺回/etc/resolv.conf的控制权

下文所述适用于ubuntu 16.10及更新的版本

```
systemctl disable --now systemd-resolved.service
rm /etc/resolv.conf
cat >/etc/resolv.conf << EOF
nameserver 8.8.8.8
nameserver 1.1.1.1
EOF
chmod 0644 /etc/resolv.conf
```

## 三，参考来源

[ubuntu系统上systemd-resolved不使用127.0.0.53的方法](https://dyrnq.com/ubuntu-update-etc-resolve-conf/)

[重新夺回对 /etc/resolv.conf 的控制权](https://icloudnative.io/posts/resolvconf-tutorial/#5-systemd-resolved)
