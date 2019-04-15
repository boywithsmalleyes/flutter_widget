import 'package:flutter/material.dart';

//**********************************/
/*                                 *
 *  create by wangxu on 2019/4/15
 *                                 *
 ***********************************/
class ScaleAnimationTest extends StatefulWidget {
  @override
  _ScaleAnimationTestState createState() => new _ScaleAnimationTestState();
}

class _ScaleAnimationTestState extends State<ScaleAnimationTest>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.bounceIn);
    _animation = Tween(begin: 0.0, end: 300.0).animate(_animation)
      ..addStatusListener((AnimationStatus state) {
        switch(state) {
          case AnimationStatus.forward:
            print('forwart');
            break;
          case AnimationStatus.completed:
            print('completed');
            _controller.reverse(from: 300.0);
            break;
          case AnimationStatus.reverse:
            print('reverse');
            break;
          case AnimationStatus.dismissed:
            _controller.forward(from: 0.0);
            print('dismissed');
            break;
        }
      })
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image(
        image: AssetImage("images/WechatIMG15.jpeg"),
        width: _animation.value,
        height: _animation.value,
      ),
    );
  }
}
