+++
title = "无需cmd后台运行exe程序并实现开机自启"
date = 2022-12-31T10:14:59+08:00
path = "2022/12/31/无需cmd后台运行exe程序并实现开机自启"
description = "在探索naiveproxy之类的exe程序如何方便快捷地在电脑上启动时发现了一种不错的方法。 即创建vbs文件 以naive.exe为例，在同目录下创建一个run.vbs文件，在其中填入以下内容 CreateObject"
[taxonomies]
categories = ["技术教程"]
tags = ["windows"]
+++

在探索naiveproxy之类的exe程序如何方便快捷地在电脑上启动时发现了一种不错的方法。

即**创建vbs文件**

以naive.exe为例，在同目录下创建一个run.vbs文件，在其中填入以下内容

```
CreateObject("WScript.Shell").Run "naive.exe",0
```

完成后，双击这个vbs文件即可

### 实现开机自启

创建上述vbs文件的快捷方式，然后win + r，输入shell:startup，会打开一个文件夹，把vbs文件的快捷方式粘贴进去就可以实现开机自启了。
