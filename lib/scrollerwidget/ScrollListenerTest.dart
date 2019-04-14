import 'package:flutter/material.dart';

//**********************************/
/*                                 *
 *  create by wangxu on 2019/4/14
 *                                 *
 ***********************************/
class ScrollListenerTest extends StatefulWidget {
  @override
  _ScrollListenerTestState createState() => new _ScrollListenerTestState();
}

class _ScrollListenerTestState extends State<ScrollListenerTest> {
  ScrollController _scrollController = new ScrollController();

  bool showTopButton = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      print(_scrollController.offset);
      var offset = _scrollController.offset;
      if (offset >= 1000 && !showTopButton) {
        setState(() {
          showTopButton = true;
        });
      } else if (offset < 1000 && showTopButton) {
        setState(() {
          showTopButton = false;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: <Widget>[
        ListView.builder(
            controller: _scrollController,
            itemExtent: 50.0,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('$index'),
                  Divider(height: 10, color: Colors.red,)
                ],
              );
            },
            itemCount: 100),
        RaisedButton(
          child: showTopButton ? Icon(Icons.arrow_upward) : null,
          onPressed: () {
            _scrollController.animateTo(
              0,
              duration: Duration(milliseconds: 50),
              curve: Curves.ease,
            );
          },
        ),
      ],
    );
  }
}
