import 'package:flutter/material.dart';

/**
 *
 * @author wangxu
 * @date 19-4-10
 */
class TapBoxCWidget extends StatefulWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  const TapBoxCWidget({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TapBoxCWidgetState();
  }
}

class TapBoxCWidgetState extends State<TapBoxCWidget> {
  bool _handleHighlight = false;

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _handleHighlight = false;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _handleHighlight = true;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _handleHighlight = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: Container(
        child: Center(
          child: Text(
            widget.active ? "Active" : "Inactive",
            style: TextStyle(fontSize: 30.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: widget.active ? Colors.green[700] : Colors.grey[500],
          border: _handleHighlight
              ? new Border.all(color: Colors.teal[700], width: 10.0)
              : null,
        ),
      ),
    );
  }
}
