import 'package:flutter/material.dart';
import 'chat_app.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title:"Chat App",
      theme: new ThemeData(
        primarySwatch: Colors.deepPurple,
        brightness: Brightness.dark,
      ),
      home: new ChatApp(),


    );
  }
}
