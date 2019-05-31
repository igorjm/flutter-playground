import 'package:flutter/material.dart';

import 'home_page.dart';
import 'login_page.dart';
import 'sign_up_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      routes: <String, WidgetBuilder> {
        '/landingpage': (BuildContext context) => new MyApp(),
        '/signup': (BuildContext context) => new SignupPage(),
        '/homepage': (BuildContext context) => new HomePage()
      },
    );
  }
}