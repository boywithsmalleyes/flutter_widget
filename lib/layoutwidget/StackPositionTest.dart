import 'package:flutter/material.dart';

/**
 *
 * @author wangxu
 * @date 19-4-12
 */
class StackPositionTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StackPositionTestState();
  }
}

class StackPositionTestState extends State<StackPositionTest> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: <Widget>[//  左对齐
          Positioned(
            left: 18.0,
            child: Text("I am Jack"),
          ),
          // 未设置定位或部分定位 widget
          Container(
            alignment: Alignment.center,
            child: Text(
              "Hello world",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.red,
          ),

          // 顶部对齐
          Positioned(
            top: 18,
            right: 18,
            child: Text("Your friend"),
          )
        ],
      ),
    );
  }
}
