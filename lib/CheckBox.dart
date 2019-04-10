import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
  @override
  _CheckBoxState createState() => new _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool _switchState = false;
  bool _checkboxState = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Switch(
          value: _switchState,
          activeColor: Colors.red,
          onChanged: (value) {
            setState(() {
              _switchState = value;
            });
          },
        ),
        Checkbox(
          value: _checkboxState,
          activeColor: Colors.blue,
          tristate: true,
          onChanged: (value) {
            setState(() {
              _checkboxState = value;
            });
          },
        )
      ],
    );
  }
}
