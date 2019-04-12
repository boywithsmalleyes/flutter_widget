import 'package:flutter/material.dart';

/**
 *
 * @author wangxu
 * @date 19-4-10
 */

class TapBoxBPage extends StatelessWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  const TapBoxBPage({Key key, this.active, this.onChanged}) : super(key: key);

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            active ? "Active" : "Inactive",
            style: TextStyle(fontSize: 30.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: active ? Colors.green[700] : Colors.grey[600]
        ),
      ),
    );
  }
}
