import 'package:flutter/material.dart';

import 'services/auth.dart';
import 'services/user_management.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String _email;
  String _password;

  GoogleSignIn googleAuth = new GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: 'hero',
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 50.0,
                    child: Image.asset('assets/flutter-icon.png'),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              TextField(
                decoration: InputDecoration(hintText: 'Email'),
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              SizedBox(height: 15.0),
              TextField(
                decoration: InputDecoration(hintText: 'Password'),
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
              ),
              SizedBox(height: 15.0),
              RaisedButton(
                child: Text('Login'),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 7.0,
                onPressed: () {
                  FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: _email,
                      password: _password
                  ).then((FirebaseUser user) {
                    Navigator.of(context).pushReplacementNamed('/homepage');
                  }).catchError((e) {
                    print(e);
                  });
                },
              ),
              SizedBox(height: 15.0),
              Text('Don\'t have an account?'),
              SizedBox(height: 15.0),
              RaisedButton(
                child: Text('Sign up'),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 7.0,
                onPressed: () {
                  Navigator.of(context).pushNamed('/signup');
                },
              ),
              SizedBox(height: 15.0),
              Text('Or'),
              GoogleSignInButton(
                onPressed: () {
                  authService.googleSignIn().then((signedInUser) {
                    UserManagement().storeNewUser(signedInUser, context);
                  }).catchError((e) {
                    print(e);
                  });
                  Navigator.of(context).pushReplacementNamed('/homepage');
                },
                borderRadius: 10.0 // default: false
              ),
              SizedBox(height: 5.0),
              FacebookSignInButton(
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
