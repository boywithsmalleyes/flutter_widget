import 'package:flutter/material.dart';

/**
 *
 * @author wangxu
 * @date 19-4-10
 */
class ButtonTestWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ButtonTestWidgetState();
  }
}

class ButtonTestWidgetState extends State<ButtonTestWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            FlatButton(
              child: Text(
                "Flat Button",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              disabledTextColor: Colors.grey[700],
              splashColor: Colors.grey,
              colorBrightness: Brightness.dark,
//              padding: EdgeInsets.only(left: 20, bottom: 20),
              color: Colors.blue[700],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0)),
              onPressed: () => {},
            ),
            RaisedButton(
              child: Text("Raised Button"),
              splashColor: Colors.red,
              disabledColor: Colors.yellow,
              textColor: Colors.blue,
              elevation: 7,
              onPressed: () => {},
            ),
            OutlineButton(
              child: Text("OutLine Button"),
              onPressed: () => {},
            ),
            IconButton(
              icon: Icon(Icons.thumb_up),
              onPressed: () => {},
            )
          ],
        ),
        widthFactor: 10,
        heightFactor: 10,
      ),
    );
  }
}
