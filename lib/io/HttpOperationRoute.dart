import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// Created by Tony.wang on 19-5-10.
class HttpOperationRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HttpOperationRouteState();
  }
}

class HttpOperationRouteState extends State<HttpOperationRoute> {
  bool _loading = false;
  String _text = "";

  void requestByHttpClient() async {
    try {
      // 创建一个 http client
      HttpClient httpClient = new HttpClient();
      HttpClientRequest request =
          await httpClient.getUrl(Uri.parse("https://www.baidu.com"));
      // 使用 iPhone 的 UA
      request.headers.add("user-agent",
          "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1)");
      // 等待链接服务器
      HttpClientResponse response = await request.close();
      _text = await response.transform(utf8.decoder).join();
      print(response.headers);

      httpClient.close();
    } catch (e) {
      _text = "请求失败: $e";
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  void requestByDio () async{
    var dio = Dio();
    Response response = await dio.get("http://www.baidu.com");
    print("dio 获取  ${response.data.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("获取百度首页"),
              onPressed: _loading
                  ? null
                  : () async {
                      setState(() {
                        _loading = true;
                        _text = "正在请求...";
                      });

                      requestByHttpClient();
                      requestByDio();
                    },
            ),
            Container(
              width: MediaQuery.of(context).size.width - 50,
              child: Text(_text.replaceAll(new RegExp(r"\s"), "")),
            ),
          ],
        ),
      ),
    );
  }
}
