import 'dart:math' as math;

import 'package:flutter/material.dart';

/**
 *
 * @author wangxu
 * @date 19-4-12
 */
class TransformWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransformWidgetState();
  }
}

class TransformWidgetState extends State<TransformWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 130),
      child: Container(
        color: Colors.yellow,
        child: Transform(
            alignment: Alignment.topRight,
            transform: Matrix4.skewY(0.3),
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(18.0),
                  color: Colors.deepOrange,
                  child: Text("Apartment for rent!"),
                ),
                // 平移
                Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.red,
                      ),
                      child: Transform.translate(
                        offset: Offset(-20, -5),
                        child: Text("Hello world"),
                      ),
                    )),
                // 旋转
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.red),
                    child: Transform.rotate(
                      angle: math.pi / 2,
                      child: Text("Hello World"),
                    ),
                  ),
                ),
                // 缩放
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    child: Transform.scale(
                      scale: 1.5,
                      child: Text("Hello world"),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    DecoratedBox(
                      decoration: BoxDecoration(color: Colors.red),
                      child: Transform.scale(
                        scale: 1.5,
                        child: Text("Hello world"),
                      ),
                    ),
                    Text(
                      "你好，世界。",
                      style: TextStyle(color: Colors.green, fontSize: 19.0),
                    )
                  ],
                ),
                // RotateBox
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.red,
                      ),
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Text("hello world"),
                      ),
                    ),
                    Text(
                      "你好",
                      style: TextStyle(color: Colors.green, fontSize: 18),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
