import 'package:flutter/material.dart';
import 'package:newsapp/views/authenticate.dart';
import 'home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return either Home or Authenticate widget
    return Authenticate();
  }
}
