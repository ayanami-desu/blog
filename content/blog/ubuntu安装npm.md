+++
title = "ubuntu安装npm"
date = 2022-06-23T16:41:00+08:00
path = "2022/06/23/ubuntu安装npm"
description = "在sudo aptget install npm之后还不够，此时的npm和nodejs的版本都太低，无法正常安装包。 使用n来管理npm的版本（n是一个npm的包，专门用来管理node的版本） npm i n g 再n "
[taxonomies]
categories = ["技术教程"]

[extra]
comments = "wp-87"
+++

在`sudo apt-get install npm`之后还不够，此时的npm和nodejs的版本都太低，无法正常安装包。

使用n来管理npm的版本（n是一个npm的包，专门用来管理node的版本）

`npm i n -g`

再`n stable`

之后根据提示操作即可

最后就可以正常使用npm啦
