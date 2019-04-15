import 'package:flutter/material.dart';

// Created by Tony.wang on 19-4-15.
class NotificationTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NotificationTestState();
  }
}

class NotificationTestState extends State<NotificationTest> {
  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('$index'),
          );
        },
        itemCount: 100,
      ),
      onNotification: (notification) {
        switch (notification.runtimeType) {
          case ScrollStartNotification:
            print('开始滚动');
            break;
          case ScrollUpdateNotification:
            print("正在滚动${notification.toString()}");
            break;
          case ScrollEndNotification:
            print('滚动停止');
            break;
          case OverscrollNotification:
            print("滚动到边界");
            break;
        }
      },
    );
  }
}
