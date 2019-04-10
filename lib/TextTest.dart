import 'package:flutter/material.dart';

/**
 *
 * @author wangxu
 * @date 19-4-10
 */
class TextTestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Text(
          "Hello World" * 4,
          textAlign: TextAlign.center,
        ),
        Text(
          "Hello World" * 6,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          "Hello world" * 8,
          textScaleFactor: 1.5,
          style: TextStyle(
              letterSpacing: 2,
              wordSpacing: 4,
              color: Colors.blue,
              fontSize: 18.0,
              textBaseline: TextBaseline.ideographic,
              height: 1.2,
              locale: Locale("China"),
              fontFamily: "Courier",
              background: new Paint()..color = Colors.yellow,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.dashed),
        ),
        DefaultTextStyle(
            style: TextStyle(
              color: Colors.red,
              fontSize: 20,
            ),
            textAlign: TextAlign.start,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Hello world!"),
                Text("I am Jack"),
                Text(
                  "I am Jack",
                  style: TextStyle(color: Colors.grey, inherit: false),
                ),
              ],
            )),
        Text.rich(TextSpan(
            text: "Home: ",
            style: TextStyle(
                fontSize: 20,
                color: Colors.yellow,
                decorationStyle: TextDecorationStyle.wavy),
            children: [
              TextSpan(
                  text: "https://wwww.baidu.com",
                  style: TextStyle(color: Colors.blue, inherit: false),
                  recognizer: null),
              TextSpan(text: " 点击跳转")
            ])),
      ],
    );
  }
}
