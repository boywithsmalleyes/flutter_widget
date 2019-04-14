import 'package:flutter/material.dart';

//**********************************/
/*                                 *
 *  create by wangxu on 2019/4/14
 *                                 *
 ***********************************/
class WillPopScopeTest extends StatefulWidget {
  @override
  _WillPopScopeTestState createState() => new _WillPopScopeTestState();
}

class _WillPopScopeTestState extends State<WillPopScopeTest> {
  @override
  Widget build(BuildContext context) {
    DateTime _lastPressAt;
    return WillPopScope(
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Text("再次点击返回键，退出程序"),
      ),
      onWillPop: () async {
        if (_lastPressAt == null ||
            DateTime.now().difference(_lastPressAt) > Duration(seconds: 1)) {
          _lastPressAt = DateTime.now();
          return false;
        }
        return true;
      },
    );
  }
}
