import 'package:flutter/material.dart';
import 'package:flutter_widget/layoutwidget/TapBoxC.dart';

/**
 *
 * @author wangxu
 * @date 19-4-10
 */
class ParentCWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ParentCWidgetState();
  }
}

class ParentCWidgetState extends State<ParentCWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: TapBoxCWidget(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}
