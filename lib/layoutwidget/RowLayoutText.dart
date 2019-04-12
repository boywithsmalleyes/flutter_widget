import 'package:flutter/material.dart';

/**
 * @author wangxu
 * @date 2019/4/11
 */
class RowLayoutText extends StatefulWidget {
  @override
  _RowLayoutTextState createState() => new _RowLayoutTextState();
}

class _RowLayoutTextState extends State<RowLayoutText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.red,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[Text("Hello world"), Text("I am  Tony")],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//class _RowLayoutTextState extends State<RowLayoutText> {
//  @override
//  Widget build(BuildContext context) {
//    return Column(
//      crossAxisAlignment: CrossAxisAlignment.start,
//      children: <Widget>[
//        Row(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[Text("Row 1"), Text("Row 2")],
//        ),
//        Row(
//          mainAxisSize: MainAxisSize.max,
//          mainAxisAlignment: MainAxisAlignment.end,
//          children: <Widget>[Text("Row 1"), Text("Row 2")],
//        ),
//        Row(
//          textDirection: TextDirection.rtl,
//          mainAxisAlignment: MainAxisAlignment.end,
//          children: <Widget>[Text("Row 1"), Text("Row 2")],
//        ),
//        Row(
//          crossAxisAlignment: CrossAxisAlignment.end,
//          verticalDirection: VerticalDirection.down,
//          children: <Widget>[
//            Text(
//              "Row 1",
//              style: TextStyle(fontSize: 32),
//            ),
//            Text("Row 2")
//          ],
//        ),
//      ],
//    );
//  }
//}
