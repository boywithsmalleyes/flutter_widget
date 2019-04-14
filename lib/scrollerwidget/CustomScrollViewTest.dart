import 'package:flutter/material.dart';

//**********************************/
/*                                 *
 *  create by wangxu on 2019/4/14
 *                                 *
 ***********************************/
class CustomScrollViewTest extends StatefulWidget {
  @override
  _CustomScrollViewTestState createState() => new _CustomScrollViewTestState();
}

class _CustomScrollViewTestState extends State<CustomScrollViewTest> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 250,
            actions: <Widget>[
              Image.asset(
                "images/icon_button_back.png",
                width: 28,
                height: 14,
              ),
            ],
            leading: Image.asset(
              "images/icon_button_back.png",
              width: 28,
              height: 14,
            ),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text("Demo"),
              background: Image.asset(
                "images/WechatIMG15.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(8.0),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: Text("Grid item $index"),
                  );
                },
                childCount: 20,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 4,
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50,
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text("list item $index"),
              );
            }, childCount: 50),
          ),
        ],
      ),
    );
  }
}
