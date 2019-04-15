import 'package:flutter/material.dart';

// Created by Tony.wang on 19-4-15.
class CustomNotification extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CustomNotificationState();
  }
}

class CustomNotificationState extends State<CustomNotification> {
  String _msg="";

  @override
  Widget build(BuildContext context) {
    return NotificationListener<MyNotification>(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Builder(
              builder: (context) {
                return RaisedButton(
                  onPressed: () => MyNotification('Hi').dispatch(context),
                  child: Text("Send Notification"),
                );
              },
            ),
            Text(_msg),
          ],
        ),
      ),
      onNotification: (notification) {
        setState(() {
          _msg += notification.msg;
        });
      },
    );
  }
}

class MyNotification extends Notification {
  final String msg;

  MyNotification(this.msg);
}
