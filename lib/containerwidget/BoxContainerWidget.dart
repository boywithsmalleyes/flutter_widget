import 'package:flutter/material.dart';

/**
 *
 * @author wangxu
 * @date 19-4-12
 */
class BoxContainerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BoxContainerWidgetState();
  }
}

class BoxContainerWidgetState extends State<BoxContainerWidget> {
  @override
  Widget build(BuildContext context) {
    Widget redBox = DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
      child: Text("ssssssssssss" * 5),
    );

    return ConstrainedBox(
        constraints: BoxConstraints(minHeight: 50, maxWidth: double.infinity),
        child: Column(
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(minHeight: 70, maxWidth: 100),
              child: redBox,
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.red,
                image: DecorationImage(
                    image: AssetImage("images/WechatIMG15.png")),
                gradient:
                    LinearGradient(colors: [Colors.red, Colors.orange[700]]),
                borderRadius: BorderRadius.circular(3.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black54,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 4.0),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 18),
                child: Text(
                  "login",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              position: DecorationPosition.background,
            ),
          ],
        ));
  }
}
