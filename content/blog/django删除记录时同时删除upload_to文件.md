+++
title = "django删除记录时同时删除upload_to文件"
date = 2023-04-28T16:26:42+08:00
path = "2023/04/28/django删除记录时同时删除upload_to文件"
description = "Django在admin后台直接删除一条数据时, file = models.FileFielduploadto=‘file’上传的文件并不会删除。通过配置钩子函数可以解决这个问题。 在models.py加入以下内容 f"
[taxonomies]
categories = ["技术教程"]
tags = ["database", "django", "python"]

[extra]
comments = "wp-222"
+++

Django在admin后台直接删除一条数据时, `file = models.FileField(upload_to=‘file’)`上传的文件并不会删除。通过配置钩子函数可以解决这个问题。

在models.py加入以下内容

```
from django.db.models.signals import pre_delete
from django.dispatch.dispatcher import receiver
@receiver(pre_delete, sender=AddDateModel)
def mymodel_delete(sender, instance, **kwargs):
  # Pass false so FileField doesn't save the model.
  instance.file.delete(False)
```

其中的`sender=AddDateModel`替换为对应模型类名即可。
