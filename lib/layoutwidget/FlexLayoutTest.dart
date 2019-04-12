import 'package:flutter/material.dart';

/**
 * @author wangxu
 * @date 2019/4/11
 */
class FlexLayoutTest extends StatefulWidget {
  @override
  _FlexLayoutTestState createState() => new _FlexLayoutTestState();
}

class _FlexLayoutTestState extends State<FlexLayoutTest> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                height: 30,
                color: Colors.red,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: 30,
                color: Colors.green,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: SizedBox(
            height: 100.0,
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Expanded(
                    flex: 2,
                    child: Container(
                      height: 30,
                      color: Colors.red,
                    )),
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 30.0,
                    color: Colors.green,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
