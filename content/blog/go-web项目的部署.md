+++
title = "go web项目的部署"
date = 2022-09-21T20:20:20+08:00
path = "2022/09/21/go-web项目的部署"
description = "下午准备进行个人图站后端的部署。第一次用go写东西，不知道怎么部署，就去搜索了一下。看到最多的方法是使用supervisor 于是我直接apt install supervisor，完成了安装，到了启动这部分直接给我报错"
[taxonomies]
categories = ["技术教程"]
+++

下午准备进行个人图站后端的部署。第一次用go写东西，不知道怎么部署，就去搜索了一下。看到最多的方法是使用`supervisor`

于是我直接apt install supervisor，完成了安装，到了启动这部分直接给我报错了，😅

`The supervisor==3.3.1' distribution was not found`

似乎将python3设为默认的py版本就会产生这个报错。

问题就开始跑偏了，又去网上搜索怎么解决这个问题。一顿操作之后，就开始报另一个错了。

到这个地步我开始思考，为什么非得用supervisor不可，就没有别的方法吗

有了这个想法之后我很快就想到了去看看[alist](https://github.com/alist-org/alist)的部署脚本。

（写这个项目的时候也没少~~抄~~模仿alist的代码）

部署脚本在这里<https://s.nn.ci/alist.sh>

核心部分是在`/etc/systemd`下创建一个`project.service`

然后在`project.service`写入如下内容

```
[Unit]
Description=Projectname service
Wants=network.target
After=network.target network.service

[Service]
Type=simple
WorkingDirectory=#工作目录
ExecStart=#运行命令
KillMode=process

[Install]
WantedBy=multi-user.target
```

保存之后再执行

```
systemctl daemon-reload
systemctl enable project >/dev/null 2>&1
systemctl restart project
```

然后就可以通过systemctl命令管理程序的运行了

最后的吐槽，中文圈的内容都是抄来抄去，不管翻多少页的搜索结果，大概也只能看到同样的东西👍

最后的最后，感谢alist作者，alist很好用。代码也很好看。
