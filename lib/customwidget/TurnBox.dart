import 'package:flutter/material.dart';

// Created by Tony.wang on 19-4-16.
class TurnBox extends StatefulWidget {
  final double turns;
  final int speed;
  final Widget child;

  const TurnBox({Key key, this.turns = .0, this.speed = 200, this.child})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TurnBoxState();
  }
}

class TurnBoxState extends State<TurnBox> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new AnimationController(
        vsync: this, lowerBound: -double.infinity, upperBound: double.infinity);
    _controller.value = widget.turns;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: widget.child,
    );
  }

  @override
  void didUpdateWidget(TurnBox oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    // 旋转角度发生变化时，执行过度动画
    if (oldWidget.turns != widget.turns) {
      _controller.animateTo(
        widget.turns,
        duration: Duration(microseconds: widget.speed ?? 200),
        curve: Curves.easeOut,
      );
    }
  }
}
