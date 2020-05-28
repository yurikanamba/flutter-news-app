import 'package:flutter/material.dart';
import 'package:newsapp/helper/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in to TechInt 💻 ⌘',
            style: TextStyle(color: Colors.tealAccent)),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: RaisedButton(
            child: Text('Sign in anonymously'),
            onPressed: () async {
              dynamic result = await _auth.signInAnon();
              if (result == null) {
                print('error signing in');
              } else {
                print('signed in');
                print(result);
              }
            }),
      ),
    );
  }
}
