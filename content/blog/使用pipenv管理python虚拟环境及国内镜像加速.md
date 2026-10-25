+++
title = "使用pipenv管理python虚拟环境及国内镜像加速"
date = 2022-05-04T20:42:51+08:00
path = "2022/05/04/使用pipenv管理python虚拟环境及国内镜像加速"
description = "使用pipenv能实现在不同的项目中安装不同的python版本和使用不同的模块，方便项目管理和维护。 但是众所周知，由于国内的网络环境，使用pip下载包时总是会失败，让人及其火大。 临时解决方法 例如： pip inst"
[taxonomies]
categories = ["技术教程"]
+++

使用pipenv能实现在不同的项目中安装不同的python版本和使用不同的模块，方便项目管理和维护。

但是众所周知，由于国内的网络环境，使用pip下载包时总是会失败，让人及其火大。

### 临时解决方法

例如：

```
pip install django -i https://pypi.tuna.tsinghua.edu.cn/simple
```

在命令后加上要使用的源即可，其他可用的源如下（注意要使用https）

```
https://pypi.tuna.tsinghua.edu.cn/simple #清华大学

https://mirrors.aliyun.com/pypi/simple/ #阿里云

https://pypi.mirrors.ustc.edu.cn/simple/ #中国科技大学

https://pypi.douban.com/simple/ #豆瓣
```

### 一劳永逸法

在`/root`目录下创建 `.pip/pip.conf`，内容为

```
[global]
index-url = https://pypi.tuna.tsinghua.edu.cn/simple
[install]
trusted-host=mirrors.aliyun.com
```

## pipenv的使用

```
pip install pipenv
```

安装之后在想要创建虚拟环境的目录下运行`pipenv install`即可。

创建完之后，目录下会出现`Pipfile`和`Pipfile.lock`两个文件

修改Pipfile文件，将其中的镜像源地址更改为上面提供的源地址。后续的包下载就可以被加速。

#### 常用命令

`pipenv shell` 进入虚拟环境

pipenv install **** 安装模块

pipenv --rm 清除虚拟环境，Pipfile会被保留

pipenv run python ***.py 使用虚拟环境执行命令

> <https://hellogitlab.com/backend/python/X_pipenv.html>
>
> 更多参见
