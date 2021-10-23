import 'package:flutter/material.dart';

class ClassifyPage extends StatelessWidget {
  const ClassifyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("分类"),
      ),
      body: Center(
        child: Text("分类页面"),
      ),
    );
  }
}
