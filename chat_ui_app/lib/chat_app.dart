import 'package:flutter/material.dart';
import 'chat_window.dart';
class ChatApp extends StatefulWidget {
  @override
  _ChatAppState createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Soul Chat App"),
        centerTitle: true,
      ),
      body: new ChatWindow(),
    );
  }
}
