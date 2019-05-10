import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

// Created by Tony.wang on 19-5-10.
class FileOperationRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FileOperationRouteState();
  }
}

class FileOperationRouteState extends State<FileOperationRoute> {
  int _counter;

  @override
  void initState() {
    _readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
    super.initState();
  }

  Future<File> _getLocalFile() async {
    // 获取应用目录
    String dir = (await getApplicationDocumentsDirectory()).path;
    print('$dir');
    return new File('$dir/counter.txt');
  }

  Future<int> _readCounter() async {
    try {
      File file = await _getLocalFile();
      String contents = await file.readAsString();
      return int.parse(contents);
    } on FileSystemException {
      return 0;
    }
  }

  Future<Null> _incrementCounter() async {
    setState(() {
      _counter++;
    });
    await (await _getLocalFile()).writeAsString('$_counter');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("文件操作"),
      ),
      body: Center(
        child: Text('点击了 $_counter 次'),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add)),
    );
  }
}
