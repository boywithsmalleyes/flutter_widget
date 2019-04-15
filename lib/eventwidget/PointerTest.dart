import 'package:flutter/material.dart';

// Created by Tony.wang on 19-4-15.
class PointerTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PointerTestState();
  }
}

class PointerTestState extends State<PointerTest> {
  @override
  Widget build(BuildContext context) {
    PointerEvent _event;

    Widget eventTest() {
      return Listener(
        onPointerDown: (PointerDownEvent event) => setState(() {
              print("触发 Down 事件");
              _event = event;
            }),
        onPointerMove: (PointerMoveEvent event) => setState(() {
              _event = event;
              print("Move Event " +
                  _event.toString() +
                  "\n" +
                  _event.delta.toString() +
                  "${_event.pressure}");
            }),
        onPointerUp: (PointerUpEvent event) {
          setState(() {
            _event = event;
            print("up event" + _event.toString());
          });
        },
        child: Container(
          alignment: Alignment.center,
          color: Colors.blue,
          width: 300,
          height: 150,
          child: Text(
            _event?.toString() ?? "",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
      );
    }

    // 默认 deferToChildBehavior
    Widget deferToChildBehaviorTest() {
      return Listener(
        behavior: HitTestBehavior.deferToChild,
        child: ConstrainedBox(
          constraints: BoxConstraints.tight(Size(300, 150)),
          child: Center(
            child: Text("Box A"),
          ),
        ),
        onPointerDown: (event) => print('Down A'),
      );
    }

    // opaqueBehaviorTest
    Widget opaqueBehaviorTest() {
      return Listener(
        behavior: HitTestBehavior.opaque,
        child: ConstrainedBox(
          constraints: BoxConstraints.tight(Size(300, 150)),
          child: Center(
            child: Text("Box A"),
          ),
        ),
        onPointerDown: (event) => print('Down A'),
      );
    }

    // 当点击 Widget 透明区域时，可以对自身边界内及底部可视区域进行 测试
    // 即 点击顶部 Widget 透明区域时，顶部 widget 和底部 widget 都可以接受事件
    Widget translucentBehaviorTest() {
      return Stack(
        children: <Widget>[
          Listener(
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(Size(300, 200)),
              child:
                  DecoratedBox(decoration: BoxDecoration(color: Colors.blue)),
            ),
            onPointerDown: (event) => print('Down 0'),
          ),
          Listener(
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(Size(200, 100)),
              child: Center(
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.green),
                  child: Text('左上角 200 × 100 范围内非文本区域点击'),
                ),
              ),
            ),
            onPointerDown: (event) => print('Down 1'),
            behavior: HitTestBehavior.translucent,
          ),
        ],
      );
    }

    // 忽略 PointerEvent
    // Absorb 执行监听事件
    // Ignore 不执行监听事件
    Widget ignorePointerEvent() {
      return Listener(
//        child: IgnorePointer(
        child: AbsorbPointer(
          child: Listener(
            child: Container(
              color: Colors.red,
              width: 200,
              height: 100,
            ),
            onPointerDown: (event) => print('in'),
          ),
        ),
        onPointerDown: (event) => print('up'),
      );
    }

//    return eventTest();
//    return deferToChildBehaviorTest();
    return ignorePointerEvent();
  }
}
