import 'package:flutter/material.dart';

/**
 *
 * @author wangxu
 * @date 19-4-11
 */
class FormTestWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormTestWidgetState();
  }
}

class FormTestWidgetState extends State<FormTestWidget> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _unameController = TextEditingController();
    TextEditingController _upwdController = TextEditingController();

    GlobalKey _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Form Test"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24.0),
        child: Form(
            child: Column(
          children: <Widget>[
            TextFormField(
              autofocus: true,
              controller: _unameController,
              decoration: InputDecoration(
//                labelText: "用户名",
                hintText: "用户名或邮箱",
                icon: Icon(Icons.person),
                border: InputBorder.none
              ),
              validator: (v) {
                return v.trim().length > 0 ? null : "用户名不能为空";
              },
            ),
            TextFormField(
              controller: _upwdController,
              obscureText: true,
              keyboardType: TextInputType.url,
              decoration: InputDecoration(
                  labelText: "密码", hintText: "登录密码", icon: Icon(Icons.lock)),
              validator: (v) {
                v.trim().length > 5 ? null : "密码不能少于6位";
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 28),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Builder(builder: (context) {
                      return RaisedButton(
                        onPressed: () {
                          if (Form.of(context).validate()) {
                            print("验证通过");
                          } else {
                            print('验证失败');
                          }
                        },
                        padding: EdgeInsets.all(15),
                        child: Text("登录"),
                        color: Theme.of(context).primaryColor,
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
