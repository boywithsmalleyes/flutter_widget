import 'dart:math';

import 'package:flutter/material.dart';

// Created by Tony.wang on 19-4-17.
class GradientCircularProgressIndicator extends StatelessWidget {
  // 粗细
  final double stokeWidth;

  // 圆的半径
  final double radius;

  // 两端是否为圆角
  final bool strokeCapRound;

  // 当前进度 取值范围 [0.0-1.0]
  final double value;

  // 进度条背景色
  final Color backgroundColor;

  // 进度条总弧度， 2 × Pi 为整圆， 小于 2 × Pi 则不是整圆
  final double totalAngle;

  //   渐变色数组
  final List<Color> colors;

  // 渐变色的终止点， 对应colors属性
  final List<double> stops;

  const GradientCircularProgressIndicator(
      {Key key,
      this.stokeWidth = 2.0,
      @required this.radius,
      this.strokeCapRound = false,
      this.value,
      this.backgroundColor = const Color(0xFFEEEEEE),
      this.totalAngle = 2 * pi,
      @required this.colors,
      this.stops})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _offset = .0;
    // 如果两端为圆角，则需要对起始位置进行调整，否则圆角部分会偏离起始位置
    // 下面调整的角度的计算公式是通过数学几何知识得出，
    if (strokeCapRound) {
      _offset = asin(stokeWidth / (radius / 2 - stokeWidth));
    }

    var _colors = colors;
    if (_colors == null) {
      Color color = Theme.of(context).accentColor;
      _colors = [color, color];
    }

    return Transform.rotate(
      angle: -pi / 2.0 - _offset,
      child: CustomPaint(
          size: Size.fromRadius(radius),
          painter: _GradientCircularProgressPainter(
            stokeWidth: stokeWidth,
            strokeCapRound: strokeCapRound,
            backgroundColor: backgroundColor,
            value: value,
            total: totalAngle,
            radius: radius,
            colors: _colors,
          )),
    );
  }
}

class _GradientCircularProgressPainter extends CustomPainter {
  final double stokeWidth;
  final bool strokeCapRound;
  final double value;
  final Color backgroundColor;
  final List<Color> colors;
  final double total;
  final double radius;
  final List<double> stops;

  _GradientCircularProgressPainter(
      {this.stokeWidth = 10.0,
      this.strokeCapRound,
      this.value,
      this.backgroundColor,
      this.colors,
      this.total,
      this.radius,
      this.stops});

  @override
  void paint(Canvas canvas, Size size) {
    if (radius != null) {
      size = Size.fromRadius(radius);
    }

    double _offset = stokeWidth / 2.0;
    double _value = (value ?? .0);
    _value = _value.clamp(.0, 1.0) * total;
    double _start = .0;

    if (strokeCapRound) {
      _start = asin(stokeWidth / (size.width - stokeWidth));
    }

    Rect rect = Offset(_offset, _offset) &
        Size(size.width - stokeWidth, size.height - stokeWidth);

    var paint = Paint()
      ..strokeCap = strokeCapRound ? StrokeCap.round : StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true
      ..strokeWidth = stokeWidth;

    // 先画背景
    if (backgroundColor != Colors.transparent) {
      paint.color = backgroundColor;
      canvas.drawArc(rect, _start, total, false, paint);
    }
    // 画前景
    if (_value > 0) {
      paint.shader = SweepGradient(
        startAngle: 0.0,
        endAngle: _value,
        colors: colors,
        stops: stops,
      ).createShader(rect);

      canvas.drawArc(rect, _start, value, false, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
