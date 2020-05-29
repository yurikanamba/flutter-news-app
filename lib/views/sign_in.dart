import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newsapp/helper/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //AuthService() imported from auth file
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in to TechInt⌘',
            style: TextStyle(color: Colors.tealAccent)),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(

//        child: RaisedButton(
//            child: Text('Sign in as a guest',
//                style: TextStyle(color: Colors.grey[900])),
//            color: Colors.tealAccent,
//            onPressed: () async {
//              //signInAnon imported from auth file
//              dynamic result = await _auth.signInAnon();
//              if (result == null) {
//                print('error signing in');
//              } else {
//                print('signed in');
//                print(result.uid);
//              }
//            }),
          ),
    );
  }
}
