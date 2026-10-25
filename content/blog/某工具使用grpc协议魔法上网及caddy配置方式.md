+++
title = "某工具使用grpc协议魔法上网及caddy配置方式"
date = 2023-02-05T20:01:05+08:00
path = "2023/02/05/某工具使用grpc协议魔法上网及caddy配置方式"
description = "看着千篇一律的ws传输方式，感觉很是无聊。发现grpc也支持cdncloudflare，就想着折腾一下。 这里有几点要注意，cf中tls等级选择严格，分流路径在caddy配置中要多填写一个/Tun。 caddy配置段 :"
[taxonomies]
categories = ["技术教程"]
+++

看着千篇一律的ws传输方式，感觉很是无聊。发现grpc也支持cdn(cloudflare)，就想着折腾一下。

这里有几点要注意，cf中tls等级选择严格，分流路径在caddy配置中要多填写一个/Tun。

caddy配置段

```
:443, example.com {
    tls <cert-path> <key-path>
    @grpc {
        protocol grpc
        path /<path>/Tun
    }
    reverse_proxy @grpc h2c://127.0.0.1:<vmess-port>
    file_server {
    root /var/www/html
  }
}
```

vmess配置段

```
"streamSettings": {
                "network": "grpc",
                "security": "none",
                "grpcSettings": {
                    "serviceName": "<path>" 
                }
            }
```

不知道用grpc使用cf会不会被阻断呢。
