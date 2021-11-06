import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('测试'),
      ),
      body: Center(
        child: Text(
          "Hello, World! 哈哈哈",
          // 文本样式
          style: TextStyle(
            color: Colors.orange,
            fontSize: 32,
          ),
          // 文本对齐方式
          textAlign: TextAlign.center,
          // 文字方向
          textDirection: TextDirection.ltr,
          // 语言
          locale: Locale('fr', 'CH'),
          // 文本是否应在软换行符处换行
          softWrap: false,
          // 最大行数
          maxLines: 1,
        ),
      ),
    );
  }
}
