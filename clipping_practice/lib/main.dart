import 'package:flutter/material.dart';
import 'components/clip1.dart';
import 'components/clip2.dart';
import 'components/clip3.dart';
import 'components/clip4.dart';
void main()=>runApp(myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Clipping Tutorial",
      home: ClipPractice(),

    );

  }
}

class ClipPractice extends StatefulWidget {
  @override
  _ClipPracticeState createState() => _ClipPracticeState();
}

class _ClipPracticeState extends State<ClipPractice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) {
                return Clip1();
              },));
            }, child: Text("Clip1")),
            ElevatedButton(onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) {
                return Clip2();
              },));
            }, child: Text("Clip2")),
            ElevatedButton(onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) {
                return Clip3();
              },));
            }, child: Text("Clip3")),
            ElevatedButton(onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) {
                return Clip4();
              },));
            }, child: Text("Clip4"))
          ],
        ),
      ),
    );
  }
}
