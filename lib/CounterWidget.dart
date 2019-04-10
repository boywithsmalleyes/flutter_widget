import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  final int initValue;

  const CounterWidget({Key key, this.initValue: 0});

  @override
  State<StatefulWidget> createState() {
    return _CounterWidgetState();
  }
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter;

  @override
  void initState() {
    super.initState();
    _counter = widget.initValue;
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Center(
      child: FlatButton(
          onPressed: () => setState(() => ++_counter),
          child: Text("$_counter")),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    print("debugFillProperties");
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies');
  }

  @override
  void dispose() {
    print('dispose');
  }

  @override
  void deactivate() {
    print('deactivate');
  }

  @override
  void reassemble() {
    print('reassemble');
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    print('didUpdateWidget');
  }
}
