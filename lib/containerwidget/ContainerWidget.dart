import 'package:flutter/material.dart';

/**
 *
 * @author wangxu
 * @date 19-4-12
 */
class ContainerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ContainerWidgetState();
  }
}

class ContainerWidgetState extends State<ContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.tightFor(width: 200, height: 150),
      margin: EdgeInsets.only(top: 50, left: 120),
      decoration: BoxDecoration(
        color: Colors.orange,
        gradient: RadialGradient(
            colors: [Colors.red[700], Colors.orange[300]],
            center: Alignment.topLeft,
            radius: 1.2),

        boxShadow: [BoxShadow(
          color: Colors.black26,
          offset: Offset(2.0, 2.0),
          blurRadius: 4.0,
        )],
      ),
      transform: Matrix4.rotationZ(.2),
      alignment: Alignment.center,
      child: Text(
        "5.20",
        style: TextStyle(color: Colors.white, fontSize: 35),
      ),
    );
  }
}
