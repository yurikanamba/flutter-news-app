import 'package:flutter/material.dart';
import 'package:newsapp/helper/auth.dart';
import 'package:newsapp/views/wrapper.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';

//main function is the first function that fires when dart file starts
void main() {
  runApp(MyApp());
}

//create new widget called MyApp which is the root widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Material App is a widget that has properties like title, theme etc.
    return StreamProvider<User>.value(
      //listens to the user obj and provides value down the widget tree
      value: AuthService().user,
      child: MaterialApp(
        title: 'TechInt',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        //what widget should load on the home screen
        home: Wrapper(),
      ),
    );
  }
}
