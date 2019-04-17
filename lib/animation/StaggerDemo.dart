import 'package:flutter/material.dart';
import 'package:flutter_widget/animation/StaggerAnimationTest.dart';
import 'package:flutter_widget/GobangTest/GobangBoard.dart';
import 'package:flutter_widget/customwidget/GradientButton.dart';
import 'package:flutter_widget/customwidget/TurnBox.dart';
import 'package:flutter_widget/indicator/GradientCircularProgressIndicator.dart';

// Created by Tony.wang on 19-4-16.
class StaggerDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StaggerDemoState();
  }
}

class StaggerDemoState extends State<StaggerDemo>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
  }

  Future<Null> _playAnimation() async {
    try {
      // 先正向执行动画
      await _controller.forward().orCancel;
      // 反向执行动画
      await _controller.reverse().orCancel;
    } on TickerCanceled {}
  }

  @override
  Widget build(BuildContext context) {
    double _turn = .0;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _playAnimation(),
      child: Center(
          child: Column(
        children: <Widget>[
          GobangBoard(),
          GradientCircularProgressIndicator(

          ),
//          Container(
//            width: 300.0,
//            height: 300.0,
//            decoration: BoxDecoration(
//              color: Colors.black.withOpacity(0.1),
//              border: Border.all(
//                color: Colors.black.withOpacity(0.5),
//              ),
//            ),
//            child: StaggerAnimationTest(
//              controller: _controller,
//            ),
//          ),
//          GradientButton(
//            colors: [Colors.orange, Colors.red],
//            height: 50,
//            onTap: () {
//              setState(() {
//                _turn += .2;
//              });
//              print('clicked');
//            },
//            child: Text("Gradient Button"),
//          ),
//          TurnBox(
//            turns: _turn,
//            speed: 500,
//            child: Image(
//              image: AssetImage(
//                "images/img_avator.jpg",
//              ),
//              width: 80,
//              height: 80,
//            ),
//          ),
        ],
      )),
    );
  }
}
