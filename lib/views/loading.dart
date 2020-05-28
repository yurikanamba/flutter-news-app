import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  //add some setTimeout here to load the page
  //route the page to the homepage
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text('Welcome to TechInt'));
  }
}
