import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
void main()=>runApp(
  new MaterialApp(
    title: "Http Json App",
    theme: new ThemeData(
      primarySwatch: Colors.red,
    ),
    home: new HomeApp(),
  )
);

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getApiData();
  }
  final String url="https://jsonplaceholder.typicode.com/todos";
  List data;
  Future<String> getApiData() async
  {
    var apiData=await http.get(url);
    var getData=json.decode(apiData.body.toString());
     setState(() {
      data=getData;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Json App with Dummy Data"),
        shadowColor: Colors.red,
        centerTitle: true,
        backgroundColor: Colors.red,
        primary: true,
        
        ),

      body: new Container(
        child: new ListView.builder(
            itemBuilder: (context, index) {
              return new Container(
                child: Center(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      new Card(
                          child: new Container(
                          child:new Text(data[index]["id"].toString())

                          ),
                      )
                    ],
                  ),
                ),
              );
            },
        itemCount: data==null?0:data.length,),
      ),
      );

  }
}
