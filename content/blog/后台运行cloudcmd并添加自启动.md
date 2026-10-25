+++
title = "后台运行cloudcmd并添加自启动"
date = 2022-06-22T16:26:33+08:00
path = "2022/06/22/后台运行cloudcmd并添加自启动"
description = "项目地址：<https://github.com/coderaiser/cloudcmd 宝塔面板的文件管理功能真的太好用了，可是宝塔面板本身隐私保护方面有不少问题。于是就在网上寻找替代这一功能的开源项目。最后发现了这个"
[taxonomies]
categories = ["技术教程"]
+++

项目地址：<https://github.com/coderaiser/cloudcmd>

宝塔面板的文件管理功能真的太好用了，可是宝塔面板本身隐私保护方面有不少问题。于是就在网上寻找替代这一功能的开源项目。最后发现了这个`cloudcmd`。

安装很简单，一句`npm i cloudcmd -g`即可。运行也只要在命令行输入`cloudcmd`就会在8000端口启动服务

可问题就出在这里，只输入cloudcmd运行，就无法进行其他操作，断开ssh之后就会停止运行。我翻文档也没发现有运行选项能让它在后台运行。

但其实有能够实现后台运行cloudcmd的方法，在文档快结束的地方：[点我](http://cloudcmd.io/#automatically-start-cloudcmd-on-boot-for-systemd)

## 方法如下：

- 定位运行cloudcmd的命令

`which cloudcmd`

- 创建service文件

`sudo nano /etc/systemd/system/cloudcmd.service`

- 使用下面的模板

```
[Unit]
Description = Cloud Commander

[Service]
TimeoutStartSec = 0
Restart = always
ExecStart = 上面的运行命令
User = 用户（如root）

[Install]
WantedBy = multi-user.target
```

- 保存，并执行下面的命令

`sudo systemctl enable --now cloudcmd`

现在就可以使用systemctl start cloudcmd来后台启动并运行程序了，也实现了开机自启。
