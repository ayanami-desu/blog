+++
title = "利用h2c实现http2自定义底层加密协议"
date = 2023-04-04T17:03:29+08:00
path = "2023/04/04/利用h2c实现http2自定义底层加密协议"
description = "众所周知，http2的规范要求使用tls作为加密。而当你有其他想法，不想用tls，但想要http2的多路复用时，这就成为阻碍你实现目标的障碍物了。 但所幸还有h2c在，利用它的相关接口，可以实现自定义加密协议。 客户端的"
[taxonomies]
categories = ["技术教程"]
tags = ["golang", "http2"]
+++

众所周知，http2的规范要求使用tls作为加密。而当你有其他想法，不想用tls，但想要http2的多路复用时，这就成为阻碍你实现目标的障碍物了。

但所幸还有h2c在，利用它的相关接口，可以实现自定义加密协议。

客户端的实现

```
t := &http2.Transport{
		DialTLSContext: func(ctx context.Context, network, addr string, cfg *tls.Config) (net.Conn, error) {
			return something.Dial()
		}}
httpClient := &http.Client{Transport: t}
```

后续使用这个`httpClient`发起请求即可

服务端的实现

```
h2s := &http2.Server{}

serveHttp := func(writer http.ResponseWriter, request *http.Request){
    //do something
}
handler := http.HandlerFunc(serveHttp)

server := &http.Server{
	Handler:   h2c.NewHandler(handler, h2s),

}

listener := net.Listener
if err := server.Serve(listener); err != nil {
	log.Fatal(err)
}
```

大概就是这样了，总之能看懂的人自然就明白了。
