import 'package:flutter/material.dart';
import 'package:flutter_demo/test_page.dart';
// import 'package:flutter_demo/routes/other/login_page.dart';
// import 'package:flutter_demo/routes/my_home_page.dart';
import 'package:flutter_demo/routes/other/register_page.dart';
import 'package:flutter_demo/states/provider/company_list_provider.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_demo/routes/other/welcome.dart';

void main() {
  return runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CompanyListProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TestPage(),
      // home: WelcomePage(),
      // home: LoginPage(),
      // home: MyHomePage(),
      // initialRoute: LoginPage(),
      routes: <String, WidgetBuilder>{
        '/register': (BuildContext context) {
          return RegisterPage();
        }
      },
    );
  }
}
