import 'package:flutter/material.dart';
import 'package:flutter_demo/common/my-icons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  bool _checkboxSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Text(
              '帮助',
              style: TextStyle(fontSize: 16),
            ),
            onPressed: () => {},
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 60),
                      child: Icon(
                        Icons.ac_unit_rounded,
                        size: 40,
                      )),
                  Form(
                      child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _unameController,
                        decoration: InputDecoration(
                            fillColor:
                                Color(0xFFF9F0F0), //背景颜色，必须结合filled: true,才有效
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            // border: _outlineInputBorder,
                            // labelText: "用户名",
                            hintText: "用户名/邮箱/手机号",
                            // icon: Icon(Icons.person),
                            // prefixIcon: Icon(Icons.email),
                            // contentPadding: ,
                            // border: InputBorder.none),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none)),
                        // 校验用户名
                        validator: (v) {
                          return v!.trim().length > 0 ? null : "用户名不能为空";
                        },
                      ),
                      Container(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _pwdController,
                        decoration: InputDecoration(
                          fillColor: Color(0xFFF9F0F0),
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          // labelText: "密码",
                          hintText: "请输入密码",
                          // icon: Icon(Icons.lock),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none),
                        ),
                        obscureText: true,
                        //校验密码
                        validator: (v) {
                          return v!.trim().length > 5 ? null : "密码不能少于6位";
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 20),
                        child: Row(
                          children: <Widget>[
                            Checkbox(
                              // side: BorderSide(color: Colors.red),
                              shape: CircleBorder(
                                  side: BorderSide(color: Color(0xFF808080))),
                              value: _checkboxSelected,
                              activeColor: Colors.red, //选中时的颜色
                              onChanged: (value) {
                                setState(() {
                                  _checkboxSelected = value!;
                                });
                              },
                            ),
                            Text.rich(TextSpan(children: [
                              TextSpan(text: "我已经阅读并同意"),
                              TextSpan(
                                  text: "《某某隐私政策》",
                                  style: TextStyle(color: Color(0xFF7D92FE)))
                            ]))
                          ],
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          child: Text("登陆"),
                          onPressed: () => {},
                          style: ButtonStyle(
                            // backgroundColor: MaterialStateProperty.all(
                            //     Color(0xffFFF8E5)), //背景颜色
                            // foregroundColor: MaterialStateProperty.all(
                            //     Color(0xffB85F23)), //字体颜色
                            // overlayColor: MaterialStateProperty.all(
                            //     Color(0xffFFF8E5)), // 高亮色
                            // shadowColor: MaterialStateProperty.all(
                            //     Color(0xffffffff)), //阴影颜色
                            // elevation: MaterialStateProperty.all(0), //阴影值
                            // textStyle: MaterialStateProperty.all(
                            //     TextStyle(fontSize: 12)), //字体
                            side:
                                MaterialStateProperty.all(BorderSide.none), //边框
                            shape: MaterialStateProperty.all(StadiumBorder(
                                side: BorderSide(
                              style: BorderStyle.solid,
                              color: Color(0xffFF7F24),
                            ))),
                          ),
                          // style: ,
                        ),
                      ),
                      Container(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('/register');
                            },
                            child: Text(
                              "新用户注册",
                              style: TextStyle(
                                  color: Color(0xFF808080), fontSize: 16),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => {},
                            child: Text("短信验证码登陆",
                                style: TextStyle(
                                    color: Color(0xFF808080), fontSize: 16)),
                          ),
                          GestureDetector(
                            onTap: () => {},
                            child: Text("验证密码",
                                style: TextStyle(
                                    color: Color(0xFF808080), fontSize: 16)),
                          )
                        ],
                      )
                    ],
                  ))
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 50),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Text(
                        '其他登陆方式',
                        style: TextStyle(fontSize: 16, color: Colors.grey[500]),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          width: 48,
                          height: 48,
                          child: Icon(MyIcons.apple),
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(24.0)),
                            border:
                                new Border.all(width: 1, color: Colors.black),
                          ),
                        ),
                        Container(
                          width: 48,
                          height: 48,
                          child: Icon(
                            MyIcons.chat,
                            color: Color(0xFF54B835),
                          ),
                          decoration: new BoxDecoration(
                            color: Color(0xFFE8F7E6),
                            borderRadius:
                                BorderRadius.all(Radius.circular(24.0)),
                          ),
                        ),
                        Container(
                          width: 48,
                          height: 48,
                          child: Icon(
                            MyIcons.phone,
                            color: Color(0xFFCA2C1F),
                          ),
                          decoration: new BoxDecoration(
                            color: Color(0xFFF9E7E7),
                            borderRadius:
                                BorderRadius.all(Radius.circular(24.0)),
                          ),
                        ),
                        Container(
                          width: 48,
                          height: 48,
                          child: Icon(
                            MyIcons.qq,
                            color: Color(0xFF53B6F6),
                          ),
                          decoration: new BoxDecoration(
                            color: Color(0xFFE8F6FD),
                            borderRadius:
                                BorderRadius.all(Radius.circular(24.0)),
                          ),
                        ),
                        Container(
                          width: 48,
                          height: 48,
                          child: Icon(
                            MyIcons.ren,
                            color: Color(0xFFE43C27),
                          ),
                          decoration: new BoxDecoration(
                            color: Color(0xFFF9E9E9),
                            borderRadius:
                                BorderRadius.all(Radius.circular(24.0)),
                          ),
                        ),
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
