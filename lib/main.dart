import 'package:flutter/material.dart';
import 'package:newsapp/views/home.dart';
import 'package:newsapp/views/loading.dart';

//main function is the first function that fires when dart file starts
void main() {
  runApp(MyApp());
}

//create new widget called MyApp which is the root widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Material App is a widget that has properties like title, theme etc.
    return MaterialApp(
      title: 'TechInt',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      //what widget should load on the home screen
//      home: Home(),
      initialRoute: '/home',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
      },
    );
  }
}
