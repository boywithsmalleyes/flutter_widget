import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 *
 * @author wangxu
 * @date 19-4-10
 */
class CupertinoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Cupertino Demo"),
      ),
      child: Center(
          child: Column(
        children: <Widget>[
          Text(
            "Hello World",
            textAlign: TextAlign.center,
          ),
          Text(
            "Hello World" * 6,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "Hello World",
            textScaleFactor: 1.5,
          )
        ],
      )),
    );
  }
}
