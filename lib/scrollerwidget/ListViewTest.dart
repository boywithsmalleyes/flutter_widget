import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

//**********************************/
/*                                 *
 *  create by wangxu on 2019/4/13
 *                                 *
 ***********************************/
class ListViewTest extends StatefulWidget {
  @override
  _ListViewTestState createState() => new _ListViewTestState();
}

class _ListViewTestState extends State<ListViewTest> {
  static const loadingTag = "##loading##";

  var _words = <String>[loadingTag];

  // 可控制数量的 ListView
  Widget customListView() {
    return ListView(
      padding: EdgeInsets.all(16),
      children: <Widget>[
        Text(
          "I\`m dedicating every day to you" * 4,
          style: TextStyle(fontSize: 30.0),
        ),
        Text(
          "Domestic life was never quite my style" * 4,
          style: TextStyle(fontSize: 30.0),
        ),
        Text(
          'When you smile, you knock me out, I fall apart' * 4,
          style: TextStyle(fontSize: 30.0),
        ),
        Text(
          'And I thought I was so smart' * 4,
          style: TextStyle(fontSize: 30.0),
        ),
      ],
    );
  }

  // 构造器创建
  Widget listViewBuilder() {
    return ListView.builder(
        itemCount: 100,
        itemExtent: 50,
        addRepaintBoundaries: false,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("item $index"),
          );
        });
  }

  // 带分割线的构造器
  Widget separatedListView() {
    Widget divider1 = Divider(
      color: Colors.red,
      height: 1,
    );
    Widget divider2 = Divider(
      height: 1,
      color: Colors.green,
    );

    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            selected: index % 2 == 0 ? true : false,
            leading: Image(
              image: AssetImage(
                "images/WechatIMG15.jpeg",
              ),
              width: 30,
            ),
            subtitle: Text("sub title"),
            trailing: Text("trailing"),
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            title: Text("$index"),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return index % 2 == 1 ? divider1 : divider2;
        },
        itemCount: 100);
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      print(_words);
      _words.insertAll(_words.length - 1,
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      setState(() {
        print(_words);
      });
    });
  }

  Widget InfiniteListView() {
    return ListView.separated(

        itemBuilder: (context, index) {
          if (_words[index] == loadingTag) {
            // 不足100条，继续添加数据
            if (_words.length  <= 100) {
              _retrieveData();
              return Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.center,
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                  ),
                ),
              );
            } else {
              return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16),
                child: Text(
                  "没有更多了",
                  style: TextStyle(color: Colors.grey),
                ),
              );
            }
          }

          return ListTile(
            title: Text(_words[index]),
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider(
              height: 0.5,
            ),
        itemCount: _words.length);
  }

  @override
  Widget build(BuildContext context) {
//    return customListView();
//    return listViewBuilder();
//    return separatedListView();
    return InfiniteListView();
  }

  @override
  void initState() {
    _retrieveData();
  }
}
