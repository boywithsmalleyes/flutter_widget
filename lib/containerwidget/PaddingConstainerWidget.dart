import 'package:flutter/material.dart';

/**
 *
 * @author wangxu
 * @date 19-4-12
 */
class PaddingContainerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PaddingContainerWidgetState();
  }
}

class PaddingContainerWidgetState extends State<PaddingContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text("Hello World"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text("I am Tony"),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20.0, 0, 20, 20),
            child: Text("Your Friend"),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text("Do you think so?"),
          )
        ],
      ),
    );
  }
}
