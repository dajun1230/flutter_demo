import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_demo/routes/my_home_page.dart';
import 'package:flutter_demo/common/application.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int counter = 3;
  dynamic _timer;

  @override
  void initState() {
    super.initState();

    countdown();
  }

  void countdown() {
    _timer = new Timer.periodic(Duration(seconds: 1), (timer) {
      if (counter == 1) {
        _timer.cancel();
        _timer = null;

        // 页面跳转
        goHomePage();
      }

      setState(() {
        counter = --counter;
      });
    });
  }

  void goHomePage() {
    Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(builder: (BuildContext context) => MyHomePage()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // 屏幕宽高
    Application.screenHeight = size.height;
    Application.screenWidth = size.width;
    // 顶部状态栏高度
    Application.statusBarHeight = MediaQuery.of(context).padding.top;
    // 底部安全距离
    Application.bottomBarHeight = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: Image.asset(
              'assets/images/welcome.jpeg',
              height: Application.screenHeight,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
              top: Application.statusBarHeight,
              right: 20,
              child: Chip(
                label: Text('$counter秒'),
                backgroundColor: Colors.transparent,
              ))
        ],
      ),
    );
  }
}
