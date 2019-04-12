import 'package:flutter/material.dart';
import 'package:flutter_widget/layoutwidget/TapBoxB.dart';

/**
 *
 * @author wangxu
 * @date 19-4-10
 */
class ParentWidgetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ParentWidgetPageState();
  }
}

class ParentWidgetPageState extends State<ParentWidgetPage> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: TapBoxBPage(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}
