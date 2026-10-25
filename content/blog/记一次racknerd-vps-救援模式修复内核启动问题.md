+++
title = "记一次racknerd vps 救援模式修复内核启动问题"
date = 2023-04-28T16:20:06+08:00
path = "2023/04/28/记一次racknerd-vps-救援模式修复内核启动问题"
description = "因为折腾bbr而尝试安装了新内核，结果却导致vps无法正常启动。 经过查找，发现这些vps服务商的后台面板一般都会有“救援模式”，进入这个模式，可以对原系统进行救援。 由于是安装了新内核导致系统无法正常启动，所以在救援模"
[taxonomies]
categories = ["技术教程"]
tags = ["linux", "racknerd", "vps"]

[extra]
comments = "wp-219"
+++

因为折腾bbr而尝试安装了新内核，结果却导致vps无法正常启动。

经过查找，发现这些vps服务商的后台面板一般都会有“救援模式”，进入这个模式，可以对原系统进行救援。

由于是安装了新内核导致系统无法正常启动，所以在救援模式里把那个内核卸载即可。

```
mount /dev/vda1 /mnt
mount -o bind /dev /mnt/dev
mount -o bind /proc /mnt/proc
mount -o bind /run /mnt/run
mount -o bind /sys /mnt/sys 
#或下面的for循环挂载
for d in dev sys run proc; do sudo mount -o bind /$d /mnt/$d; done
#如果只挂载系统磁盘不挂载上面的运行时目录在安装内核的时候会报下面的错
#“/usr/sbin/grub-probe: error: cannot find a device for / (is /dev mounted?).”
#改变根为/mnt目录
chroot /mnt
```

这样就能访问到根目录了。

至于如何卸载内核，可以去问问chatgpt。
