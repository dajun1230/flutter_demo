import 'package:flutter/material.dart';
import 'package:flutter_demo/cart/index.dart';
import 'package:flutter_demo/classify/index.dart';
import 'package:flutter_demo/home/index.dart';
import 'package:flutter_demo/my/index.dart';

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
            new BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text("首页")),
            new BottomNavigationBarItem(
                icon: Icon(Icons.list), title: Text("分类")),
            new BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), title: Text("购物车")),
            new BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), title: Text("我的")),
          ]),
    );
  }
}
