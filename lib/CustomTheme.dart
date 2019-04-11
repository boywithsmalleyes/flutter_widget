import 'package:flutter/material.dart';

/**
 *
 * @author wangxu
 * @date 19-4-11
 */
class CustomThemeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CustomThemeWidgetState();
  }
}

class CustomThemeWidgetState extends State<CustomThemeWidget> {
  FocusNode focusNode1 = FocusNode();
  bool _clean = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode1.addListener(() {
      print(focusNode1.hasFocus ? "我获得焦点" : '我失去了焦点');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          hintColor: Colors.grey[900],
          inputDecorationTheme: InputDecorationTheme(
              labelStyle: TextStyle(
                color: Colors.grey,
              ),
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 14.0,
              ))),
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
                labelText: "用户名",
                prefixIcon: Icon(Icons.person),
                hintText: "用户名或邮箱"),
          ),
          TextField(
            focusNode: focusNode1,
            autofocus: true,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock),
              suffixIcon: _clean ? Icon(Icons.clear) : null,
              labelText: "密码",
              hintText: "输入登录密码",
              hintStyle: TextStyle(color: Colors.grey, fontSize: 13.0),
            ),
            onChanged: (value) {
              if (value.length > 0) {
                setState(() {
                  if (focusNode1.hasFocus) {
                    _clean = true;
                  } else {
                    _clean = false;
                  }
                });
              }
            },
            obscureText: true,
          ),
          Container(
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "电子邮箱地址",
                  hintStyle: TextStyle(fontSize: 18.0, color: Colors.red),
                  prefixIcon: Icon(Icons.email),
                  border: InputBorder.none),
            ),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(color: Colors.grey[200], width: 1.0),
            )),
          ),
        ],
      ),
    );
  }
}
