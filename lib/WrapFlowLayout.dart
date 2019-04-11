import 'package:flutter/material.dart';

/**
 * @author wangxu
 * @date 2019/4/11
 */
class WrapFlowLayout extends StatefulWidget {
  @override
  _WrapFlowLayoutState createState() => new _WrapFlowLayoutState();
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;

  TestFlowDelegate(this.margin);

  @override
  void paintChildren(FlowPaintingContext context) {
    // TODO: implement paintChildren
    var x = margin.left;
    var y = margin.top;

    // 计算每一个 widget 的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    // TODO: implement getSize
    return Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate != this;
  }
}

class _WrapFlowLayoutState extends State<WrapFlowLayout> {
  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: TestFlowDelegate(EdgeInsets.all(10)),
      children: <Widget>[
        new Container(
          width: 80.0,
          height: 80.0,
          color: Colors.red,
        ),
        new Container(
          width: 80.0,
          height: 80.0,
          color: Colors.green,
        ),
        new Container(
          width: 80.0,
          height: 80.0,
          color: Colors.blue,
        ),
        new Container(
          width: 80.0,
          height: 80.0,
          color: Colors.yellow,
        ),
        new Container(
          width: 80.0,
          height: 80.0,
          color: Colors.brown,
        ),
        new Container(
          width: 80.0,
          height: 80.0,
          color: Colors.purple,
        ),
      ],
    );
//    return Wrap(
//      spacing: 8.0,
//      runSpacing: 4.0,
//      alignment: WrapAlignment.center,
//      direction: Axis.horizontal,
//      children: <Widget>[
//        Chip(
//          avatar: CircleAvatar(
//            backgroundColor: Colors.blue,
//            child: Text('A'),
//          ),
//          label: Text('Hamilton'),
//        ),
//        Chip(
//          avatar: CircleAvatar(
//            backgroundColor: Colors.blue,
//            child: Image(image: AssetImage("images/t_pwd.png")),
//          ),
//          label: Text('Lafayette'),
//        ),
//        Chip(
//          avatar: CircleAvatar(
//            backgroundColor: Colors.blue,
//            child: Text('M'),
//          ),
//          label: Text('Mulligan'),
//        ),
//        Chip(
//          avatar: CircleAvatar(
//            backgroundColor: Colors.blue,
//            child: Text('J'),
//          ),
//          label: Text('Laurens'),
//        ),
//      ],
//    );
  }
}
