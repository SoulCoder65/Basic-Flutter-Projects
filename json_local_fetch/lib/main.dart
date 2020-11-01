import 'dart:convert';

import 'package:flutter/material.dart';

void main()=>runApp(new MaterialApp(
  title: "Json local Data Fetch",
  home: new JsonApp(),
));

class JsonApp extends StatefulWidget {
  @override
  _JsonAppState createState() => _JsonAppState();
}

class _JsonAppState extends State<JsonApp> {

  List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Local Json App"),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: new Container(
        child: new Center(
          child: new FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString("jsondata/data.json"),
            builder: (context, snapshot) {

              String jsondata=snapshot.data.toString();
              var mydata=json.decode((jsondata));
              return new ListView.builder(
                  itemBuilder:(BuildContext context, int index) {
                    return new Card(
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Text(mydata[index]['name']),
                          SizedBox(height: 10,),
                          new Text(mydata[index]['age']),
                          SizedBox(height: 10,),
                        ],
                      ),
                    );
                  },
              itemCount: mydata==null?0:mydata.length);
            },
          ),
        ),

      ),
    );
  }
}
