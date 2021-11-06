import 'package:flutter/material.dart';
import 'package:flutter_demo/routes/cart/index.dart';
import 'package:flutter_demo/routes/classify/index.dart';
import 'package:flutter_demo/routes/home/index.dart';
import 'package:flutter_demo/routes/my/index.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> _list = [
    HomePage(),
    ClassifyPage(),
    CartPage(),
    MyPage(),
  ];

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void onTapChange(int selectIndex) {
    setState(() {
      _currentIndex = selectIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _list[_currentIndex],
      bottomNavigationBar: new BottomNavigationBar(
          onTap: onTapChange,
          currentIndex: _currentIndex,
          selectedItemColor: Colors.orange.shade700,
          unselectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
            new BottomNavigationBarItem(icon: Icon(Icons.list), label: "分类"),
            new BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "购物车"),
            new BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: "我的"),
          ]),
    );
  }
}
