+++
title = "Django部署中遇到的小问题"
date = 2022-05-05T09:45:00+08:00
path = "2022/05/05/django部署中遇到的小问题"
description = "Django部署中遇到的小问题 因为自己的小程序后端代码有了更新，所以准备重新部署一次。没想到按照原来的配置setting.py重新上线的后端访问出错了。 错误码是403，显示Error: CSRF Failed: Re"
[taxonomies]
categories = ["技术教程"]
+++

#### Django部署中遇到的小问题

因为自己的小程序后端代码有了更新，所以准备重新部署一次。没想到按照原来的配置`setting.py`重新上线的后端访问出错了。

错误码是403，显示`Error: CSRF Failed: Referer checking failed - https://katoumegumi.ltd does not match any trusted origins.`

当场就疑惑起来，我记得配置了`allowed_hosts`来着。

…………

经过艰难地搜索，终于找到了解决方法。原来是因为没有设置`CSRF_TRUSTED_ORIGINS`。

在`setting.py`里面加上

`CSRF_TRUSTED_ORIGINS = [ 'https://katoumegumi.ltd' ]`之后就好了。

之前没设置也能跑啊，真的莫名其妙。

> 参考来源：https://www.xknote.com/ask/60ca3cc7770cd.html
