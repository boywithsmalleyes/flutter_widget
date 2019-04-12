import 'package:flutter/material.dart';
import 'package:flutter_widget/basewidget/MyIcon.dart';

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
  String icons = "\uE914 \uE000 \uE90D";

  @override
  Widget build(BuildContext context) {
    return Container(
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
            ),
            Image(
              image: AssetImage("images/WechatIMG15.jpeg"),
              width: 100,
            ),
            Image.asset(
              "images/WechatIMG15.jpeg",
              width: 400,
              height: 80,
              fit: BoxFit.fitWidth,
              color: Colors.blue[200],
              colorBlendMode: BlendMode.darken,
              repeat: ImageRepeat.repeatX,
            ),
            Text(
              icons,
              style: TextStyle(
                  fontFamily: "MaterialIcons",
                  fontSize: 24.0,
                  color: Colors.green),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.accessibility,
                  color: Colors.green,
                ),
                Icon(
                  Icons.repeat,
                  color: Colors.red,
                ),
                Icon(
                  MyIcon.share,
                  color: Colors.grey,
                  size: 40,
                  semanticLabel: "",
                  textDirection: TextDirection.ltr,
                )
              ],
            ),
            Image(
              image: NetworkImage(
                "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
              ),
              width: 100,
            ),
            Image.network(
              "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
              width: 100,
              height: 230,
              color: Colors.blue,
              colorBlendMode: BlendMode.difference,
              repeat: ImageRepeat.repeatY,
              fit: BoxFit.fitWidth,
            ),
          ],
        ),
        widthFactor: 10,
        heightFactor: 10,
      ),
    );
  }
}
