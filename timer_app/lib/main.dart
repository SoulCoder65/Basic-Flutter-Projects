import 'package:flutter/material.dart';
import 'timer.dart';
//Main fun
void main()=>runApp(new MaterialApp(
  title: "Timer App",
  theme: ThemeData.dark(),
  home: new TimerApp(),
));
class TimerApp extends StatefulWidget {
  @override
  _TimerAppState createState() => _TimerAppState();
}

class _TimerAppState extends State<TimerApp> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Timer App",style: TextStyle(
           ),),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.watch_later_outlined),text: "Timer",),
              Tab(icon: Icon(Icons.countertops),text: "Stop Watch",),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            TimerClass(),
            Text("Bye")
          ],
        ),
        
      ),
    );
  }
}
