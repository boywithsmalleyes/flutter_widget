import 'package:flutter/material.dart';

class TapBoxA extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TapBoxAState();
  }
}

class TapBoxAState extends State<TapBoxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            _active ? 'Active' : "Inactive",
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
            color: _active ? Colors.lightGreen[700] : Colors.grey[600]),
      ),
    );
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("TapBox"),
//      ),
//      body: GestureDetector(
//        onTap: _handleTap,
//        child: Container(
//          child: Center(
//            child: Text(
//              _active ? 'Active' : "Inactive",
//              style: TextStyle(fontSize: 32.0, color: Colors.white),
//            ),
//          ),
//          width: 200.0,
//          height: 200.0,
//          decoration: BoxDecoration(
//              color: _active ? Colors.lightGreen[700] : Colors.grey[600]),
//        ),
//      ),
//    );
  }
}
