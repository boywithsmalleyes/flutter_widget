import 'package:flutter/material.dart';

// Created by Tony.wang on 19-4-16.
class GradientButton extends StatelessWidget {
  final List<Color> colors;
  final double width;
  final double height;
  final GestureTapCallback onTap;
  final Widget child;

  const GradientButton(
      {Key key, this.colors, this.width, this.height, this.onTap, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    List<Color> _colors = colors ??
        [theme.primaryColor, theme.primaryColorDark ?? theme.primaryColor];

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: _colors),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: _colors.last,
          highlightColor:Colors.transparent,
          onTap: onTap,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: height, width: width),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: DefaultTextStyle(
                    style: TextStyle(fontWeight: FontWeight.bold),
                    child: child),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
