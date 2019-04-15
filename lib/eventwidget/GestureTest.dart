import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Created by Tony.wang on 19-4-15.
class GestureTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GestureTestState();
  }
}

class GestureTestState extends State<GestureTest> {
  String _operation = "No Gesture detected";
  double _top = 0;
  double _left = 0;

  TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();
  bool _toggle = false;

  double _width = 200;

  @override
  void dispose() {
    // TODO: implement dispose
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  void updateTap(String tap) {
    setState(() {
      _operation = tap;
    });
  }

  Widget gestureTest() {
    return Center(
      child: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          color: Colors.blue,
          width: 200,
          height: 100,
          child: Text(
            _operation,
            style: TextStyle(color: Colors.white),
          ),
        ),
        onTap: () {
          print("tap");
          updateTap("Tap");
        },
        onDoubleTap: () {
          print('double tap');
          updateTap("double tap");
        },
        onLongPress: () {
          updateTap("long press");
        },
      ),
    );
  }

  // 拖拽事件
  Widget _dragTest() {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
//          left: _left,
          child: GestureDetector(
            child: CircleAvatar(
              child: Text("A"),
            ),
            onVerticalDragUpdate: (detail) {
              setState(() {
                _top += detail.delta.dy;
              });
            },
            onPanDown: (detail) {
              // 打印手指按下的位置
              print('User press position ${detail.globalPosition}');
            },
//            onPanUpdate: (detail) {
//              // 用户滑动时触发回调
//              setState(() {
//                _left += detail.delta.dx;
//                _top += detail.delta.dy;
//              });
//            },
            onPanEnd: (detail) {
              print(detail.velocity);
            },
          ),
        ),
      ],
    );
  }

  // 缩放事件
  Widget scaleTest() {
    return Center(
      child: GestureDetector(
        child: Image.asset(
          "images/WechatIMG15.jpeg",
          width: _width,
        ),
        onScaleUpdate: (detail) {
          setState(() {
            _width = 200 * detail.scale.clamp(.8, 100.0);
          });
        },
      ),
    );
  }

  // 手势识别
  Widget gestureRecognizerTest() {
    return Center(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "Hello world",
            ),
            TextSpan(
              text: "toggle color",
              style: TextStyle(
                fontSize: 30,
                color: _toggle ? Colors.blue : Colors.red,
              ),
              recognizer: _tapGestureRecognizer
                ..onTap = () {
                  setState(() {
                    _toggle = !_toggle;
                  });
                },
            ),
            TextSpan(text: "Hello world")
          ],
        ),
      ),
    );
  }

  // 竞技场测试
  Widget arenaTest() {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: CircleAvatar(
              child: Text("A"),
            ),
            onVerticalDragUpdate: (detail) {
              setState(() {
                _top += detail.delta.dy;
              });
            },
            onHorizontalDragUpdate: (detail) {
              setState(() {
                _left += detail.delta.dx;
              });
            },
          ),
        ),
      ],
    );
  }

  // 手势冲突测试
  Widget conflictTest() {
    return Stack(
      children: <Widget>[
        Positioned(
            left: _left,
            child: Listener(
              onPointerDown: (detail) {
                print('down');
              },
              onPointerUp: (detail) {
                print('up');
              },
              child: GestureDetector(
                child: CircleAvatar(
                  child: Text("A"),
                ),
                onHorizontalDragUpdate: (detail) {
                  setState(() {
                    _left += detail.delta.dx;
                  });
                },
                onHorizontalDragEnd: (detail) {
                  print('onHorizontalDragEnd');
                },
              ),
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
//    return gestureTest();
//    return _dragTest();
//    return scaleTest();
//    return gestureRecognizerTest();
//    return arenaTest();
    return conflictTest();
  }
}
