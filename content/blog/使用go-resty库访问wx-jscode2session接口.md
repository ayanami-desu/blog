+++
title = "使用go resty库访问wx.jscode2session接口"
date = 2022-11-09T17:37:09+08:00
path = "2022/11/09/使用go-resty库访问wx-jscode2session接口"
description = "之前用django写小程序后端，请求微信接口获取openid时用的都是py的requests库。现在改用go写后端，自然要找功能相似的库来用。 restyhttps://github.com/goresty/resty是"
[taxonomies]
categories = ["技术教程"]
tags = ["golang", "resty", "小程序"]

[extra]
comments = "wp-154"
+++

之前用django写小程序后端，请求微信接口获取openid时用的都是py的requests库。现在改用go写后端，自然要找功能相似的库来用。

[resty](https://github.com/go-resty/resty)是一个go编写的网络请求库。但与偏重于爬虫的requests在功能上有些许差别。下面直接贴代码

```
type wxJsonRes struct {
	Openid     string `json:"openid"`
	SessionKey string `json:"session_key"`
	UnionId    string `json:"unionid"`
	Errcode    int    `json:"errcode"`
	Errmsg     string `json:"errmsg"`
}
res1 := &wxJsonRes{}
	client := resty.New()
	_, err := client.R().ForceContentType("application/json").
		SetQueryParams(map[string]string{
			"js_code":    reqBody["code"],
			"secret":     conf.AppSecret,
			"appid":      conf.AppId,
			"grant_type": "authorization_code",
		}).SetResult(res1).Get("https://api.weixin.qq.com/sns/jscode2session")
	if err != nil {
		response.ErrorResp(c, err, 500)
		return
	}
	//fmt.Printf("%+v\n", res1)
	if res1.Errcode != 0 {
		response.ErrorStrResp(c, "服务端获取openid失败", 500)
		return
	}
```

值得注意的是，虽然resty会自动识别响应格式并解析数据到结构体，但这里如果不设置ForceContentType("application/json")，请求完成后并不能正确解析数据（大坑）

顺便提一下打印结构体的方法。`fmt.Printf("%+v\n", something)`
