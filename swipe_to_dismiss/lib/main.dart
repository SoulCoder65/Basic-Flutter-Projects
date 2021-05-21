import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Swipe to dismiss",
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> data =
  new List<String>.generate(30, (index) => "List number ${index+1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Swipe To Dismiss"),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Dismissible(
              key: new Key(data[index]),
              background:new Container(
                color: Colors.black,
              ) ,

              onDismissed: (direction) {
                data.removeAt(index);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Iteam ${index+1} dismiss")));
              },

              child: ListTile(
                title: Text("List Iteam ${data[index]}"),
              ));
        },
      ),
    );
  }
}
