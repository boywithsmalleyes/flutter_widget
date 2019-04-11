import 'package:flutter/material.dart';

/**
 *
 * @author wangxu
 * @date 19-4-11
 */
class TextFiledTestWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TextFiledTestWidgetState();
  }
}

class TextFiledTestWidgetState extends State<TextFiledTestWidget> {
  String _userName;
  String _userPwd;
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _userPwdController = TextEditingController();

  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();

  FocusScopeNode focusScopeNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode1.addListener((){
      print(focusNode1.hasFocus);
    });
    _userNameController.addListener(() {
      print(_userNameController.text);
    });

    _userPwdController.addListener(() {
      print(_userPwdController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _userNameController,
              autofocus: true,
              focusNode: focusNode1,
              decoration: InputDecoration(
                labelText: "用户名",
                hintText: "用户名或邮箱",
                prefixIcon: Icon(Icons.person),
              ),
//              onChanged: (v) {
//                print(v);
//              },
            ),
            TextField(
              keyboardType: TextInputType.text,
              obscureText: true,
              focusNode: focusNode2,
              controller: _userPwdController,
              decoration: InputDecoration(
                labelText: "密码",
                hintText: "请输入登录密码",
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 10.0
                  )
                ),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.grey,
                ),
              ),
            ),
            RaisedButton(
              child: Text(
                "登录",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                print(_userNameController.text);
                print(_userPwdController.text);
              },
            ),
//            Builder(
//              builder: (context) {
//                return Column(
//                  children: <Widget>[
            FlatButton(
              child: Text("移动焦点"),
              onPressed: () {
                if (focusScopeNode == null) {
                  focusScopeNode = FocusScope.of(context);
                }
                focusScopeNode.requestFocus(focusNode2);
              },
            ),
            ButtonBar(
              children: <Widget>[
                RaisedButton(
                  child: Text("Raise 1"),
                  onPressed: (){},
                ),
                RaisedButton(
                  child: Text("Raise 2"),
                  onPressed: (){},
                ),
                RaisedButton(
                  child: Text("Raise 3"),
                  onPressed: (){},
                )
              ],
            ),
            OutlineButton(
              child: Text("Hide Keyborad"),
              onPressed: () {
                focusNode1.unfocus();
                focusNode2.unfocus();
              },
            ),
//                  ],
//                );
//              },
//            ),
          ],
        ),
      ),
    );
  }
}
