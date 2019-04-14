import 'package:flutter/material.dart';

/************************************
 ***        @author wangxu       ***
 ***        @date 2019/4/12         ***
 ***                              ***
 ************************************
 */
class SingleChildScroll extends StatefulWidget {
  @override
  _SingleChildScrollState createState() => new _SingleChildScrollState();
}

class _SingleChildScrollState extends State<SingleChildScroll> {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    return /* Scrollbar(
      child:*/
        SingleChildScrollView(
      scrollDirection: Axis.vertical,
      reverse: false,
      padding: EdgeInsets.all(15),
      child: Center(
        child: Column(
          children: str
              .split("")
              .map((s) => Text(
                    s,
                    textScaleFactor: 2,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
