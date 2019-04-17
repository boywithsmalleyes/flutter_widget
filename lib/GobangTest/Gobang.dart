import 'package:flutter/material.dart';
import 'package:flutter_widget/GobangTest/GobangBoard.dart';

// Created by Tony.wang on 19-4-17.
class Gobang extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GobangState();
  }
}

class GobangState extends State<Gobang> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GobangBoard(),
      ],
    );
  }
}