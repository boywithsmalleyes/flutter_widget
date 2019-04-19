import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_widget/customwidget/TurnBox.dart';
import 'package:flutter_widget/indicator/GradientCircularProgressIndicator.dart';

// Created by Tony.wang on 19-4-19.
class GradientCircularProgressRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GradientCircularProgressRouteState();
  }
}

class GradientCircularProgressRouteState
    extends State<GradientCircularProgressRoute> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    bool isForward = true;
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        isForward = true;
      } else if (status == AnimationStatus.completed ||
          AnimationStatus.dismissed == status) {
        isForward ? _controller.reverse() : _controller.forward();
      } else if (status == AnimationStatus.reverse) {
        isForward = false;
      }
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
    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    children: <Widget>[
                      Wrap(
                        spacing: 10.0,
                        runSpacing: 16.0,
                        children: <Widget>[
                          GradientCircularProgressIndicator(
                            colors: [Colors.blue, Colors.blue],
                            radius: 50.0,
                            stokeWidth: 3.0,
                            value: _controller.value,
                          ),
                          GradientCircularProgressIndicator(
                            colors: [Colors.red, Colors.orange],
                            radius: 50.0,
                            stokeWidth: 3.0,
                            value: _controller.value,
                          ),
//                          GradientCircularProgressIndicator(
//                            colors: [Colors.teal, Colors.cyan],
//                            radius: 50.0,
//                            stokeWidth: 3.0,
//                            value: _controller.value,
//                          ),
                          GradientCircularProgressIndicator(
                            colors: [Colors.teal, Colors.cyan],
                            radius: 50.0,
                            stokeWidth: 3.0,
                            value: CurvedAnimation(
                                    parent: _controller,
                                    curve: Curves.decelerate)
                                .value,
                          ),
                          TurnBox(
                            turns: 1 / 8,
                            child: GradientCircularProgressIndicator(
                              colors: [Colors.red, Colors.orange, Colors.red],
                              radius: 50.0,
                              stokeWidth: 3.0,
                              value: _controller.value,
                            ),
                          ),

                          RotatedBox(
                            quarterTurns: 1,
                            child: GradientCircularProgressIndicator(
                              colors: [Colors.blue[700], Colors.blue[200]],
                              radius: 50.0,
                              stokeWidth: 3.0,
                              strokeCapRound: true,
                              backgroundColor: Colors.transparent,
                              value: _controller.value,
                            ),
                          ),

                          GradientCircularProgressIndicator(
                            colors: [
                              Colors.red,
                              Colors.amber,
                              Colors.cyan,
                              Colors.green[200],
                              Colors.blue,
                              Colors.red
                            ],
                            radius: 50.0,
                            stokeWidth: 5.0,
                            strokeCapRound: true,
                            value: _controller.value,
                          ),

                          GradientCircularProgressIndicator(
                            colors: [Colors.blue[700], Colors.blue[700]],
                            radius: 100.0,
                            stokeWidth: 20.0,
                            value: _controller.value,
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: GradientCircularProgressIndicator(
                              colors: [Colors.blue[700], Colors.blue[300]],
                              radius: 100.0,
                              stokeWidth: 20.0,
                              strokeCapRound: true,
                              value: _controller.value,
                            ),
                          ),

                          ClipRect(
                            child: Align(
                              alignment: Alignment.topCenter,
                              heightFactor: .5,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: SizedBox(
                                  child: TurnBox(
                                    turns: .75,
                                    child: GradientCircularProgressIndicator(
                                      colors: [Colors.teal, Colors.cyan[500]],
                                      radius: 100.0,
                                      stokeWidth: 8.0,
                                      totalAngle: pi,
                                      strokeCapRound: true,
                                      value: _controller.value,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),


                          SizedBox(
                            height: 104.0,
                            width: 200.0,
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Positioned(
                                  height: 200.0,
                                  top: 0,
                                  child: TurnBox(
                                    turns: .75,
                                    child:
                                    GradientCircularProgressIndicator(
                                      colors: [Colors.teal, Colors.cyan[500]],
                                      radius: 100.0,
                                      stokeWidth: 8.0,
                                      totalAngle: pi,
                                      strokeCapRound: true,
                                      value: _controller.value,
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.only(top:10),
                                  child: Text('${(_controller.value * 100).toInt()}%',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.blueGrey
                                  ),),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
