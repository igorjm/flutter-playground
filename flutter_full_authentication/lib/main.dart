import 'package:flutter/material.dart';

import 'package:flutter_full_authentication/pages/home_page.dart';
import 'package:flutter_full_authentication/pages/login_page.dart';
import 'package:flutter_full_authentication/pages/sign_up_page.dart';

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