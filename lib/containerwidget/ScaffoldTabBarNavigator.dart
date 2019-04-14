import 'package:flutter/material.dart';

/**
 *
 * @author wangxu
 * @date 19-4-12
 */
class ScaffoldTabBarNavigator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScaffoldTabBarNavigatorState();
  }
}

class ScaffoldTabBarNavigatorState extends State<ScaffoldTabBarNavigator>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 1;
  TabController _tabController;
  List tabs = ["新闻", "历史", "图片"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
//      switch (_tabController.index) {
//        case 1:
      print("Tab Clicked ${_tabController.index}");
//      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App name"),
        elevation: 2,
        bottom: TabBar(
          tabs: tabs.map((e) => Tab(text: e)).toList(),
          controller: _tabController,
        ),
        centerTitle: true,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(
              Icons.dashboard,
              color: Colors.white,
            ),
            onPressed: () {
              print("打开了抽屉");
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              print("share");
            },
          )
        ],
      ),
      drawer: MyDrawer(),
      body: TabBarView(
          controller: _tabController,
          children: tabs.map((e) {
            return Container(
              alignment: Alignment.center,
              child: Text(
                e,
                textScaleFactor: 5,
              ),
            );
          }).toList()),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),

            SizedBox(),
            IconButton(
              icon: Icon(Icons.business),
              onPressed: () {},
            ),
          ],
        ),
      ),
//      bottomNavigationBar: BottomNavigationBar(
//        items: <BottomNavigationBarItem>[
//          BottomNavigationBarItem(
//            icon: Icon(Icons.home),
//            title: Text("Home"),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.business),
//            title: Text("Business"),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.school),
//            title: Text("School"),
//          ),
//        ],
//        currentIndex: _selectedIndex,
//        fixedColor: Colors.red,
//        onTap: _onItemTapped,
//      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onAdd,
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
        elevation: 4,
        clipBehavior: Clip.antiAlias,
        isExtended: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  void _onAdd() {}
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 38),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: ClipOval(
                          child: Image.asset(
                            "images/t_pwd.png",
                            width: 80,
                          ),
                        ),
                      ),
                      Text(
                        "Tony",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.add),
                      title: Text("Add Account"),
                    ),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text("Manage accounts"),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
