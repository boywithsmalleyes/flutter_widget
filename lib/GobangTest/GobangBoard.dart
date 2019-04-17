import 'dart:math';

import 'package:flutter/material.dart';

// Created by Tony.wang on 19-4-17.
class GobangBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: Size(300, 300),
        painter: MyPainter(),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width / 15;
    double height = size.height / 15;

    // background
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = Color(0x77cdb175); // 背景为纸黄色
    canvas.drawRect(Offset.zero & size, paint);

    // 棋盘网格
    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.black87
      ..strokeWidth = 1.0;

    for (int i = 0; i <= 15; ++i) {
      double dy = height * i;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), paint);
    }

    for (int i = 0; i <= 15; ++i) {
      double dx = width * i;
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), paint);
    }

//    // 黑子
    paint
      ..style = PaintingStyle.fill
      ..color = Colors.black;
    canvas.drawCircle(
        Offset(size.width / 2 - width / 2, size.height / 2 - height / 2),
        min(width / 2, height / 2) - 2,
        paint);

    // 白子
    paint..color = Colors.white;
    canvas.drawCircle(
      Offset(size.width / 2 + width / 2, size.height / 2 - height / 2),
      min(width / 2, height / 2) - 2,
      paint,
    );
  }

  // 正确利用此回调，可以避免重绘开销，本示例我们简单的返回true
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
