import 'package:eitango_kun/source/screens/add_screen.dart';
import 'package:eitango_kun/source/screens/index_screen.dart';
import 'package:flutter/material.dart';
class App extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AddScreen(),
    );
  }
}