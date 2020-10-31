import'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var value1=0,value2=0,result=0;
  final TextEditingController t1=new TextEditingController(text: "0");
  final TextEditingController t2=new TextEditingController(text: "0");

  //  Sum Function
  void AddNum()
  {
    setState(() {
      value1=int.parse(t1.text);
      value2=int.parse(t2.text);
      result=value1+value2;
    });
  }
  //  Sum Function
  void SubNum()
  {
    setState(() {
      value1=int.parse(t1.text);
      value2=int.parse(t2.text);
      result=value1-value2;
    });

  }//  Sum Function
  void MultiplyNum()
  {
    setState(() {
      value1=int.parse(t1.text);
      value2=int.parse(t2.text);
      result=value1*value2;
    });

  }//  Divide Function
  void DivideNum()
  {
    setState(() {
      value1=int.parse(t1.text);
      value2=int.parse(t2.text);
      result=(value1~/value2);
    });

  }
  //Clear Function
  void clearFun()
  {
    setState(() {
      t1.text="0";
      t2.text="0";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: new AppBar(
        centerTitle: true,
         title: new Text("Soul Calculator"),
        backgroundColor: Colors.teal,


        ),
      body: new Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Padding(padding: const EdgeInsets.only(left: 20)),
            new TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                hintText: "Enter First Number",

              ),
              controller: t1,
            ),
            new TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                hintText: "Enter Second Number",
          ),
              controller: t2,
            ),
        new Padding(
            padding: const EdgeInsets.only(top: 20)
        ),
            new Row(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new MaterialButton(
                  child: new Text("+"),
                  color: Colors.green,
                  splashColor: Colors.deepOrange,
                  onPressed: () {
                    AddNum();
                  },
              ),
                new MaterialButton(
                  color: Colors.green,
                  splashColor: Colors.orangeAccent,
                  child: new Text("-"),
                  onPressed: () {
                    SubNum();
                  },
                )
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new MaterialButton(
                  child: new Text("X"),
                  color: Colors.green,
                  splashColor: Colors.orangeAccent,
                  onPressed: () {
                        MultiplyNum();
                  },
                ),
                new MaterialButton(
                  color: Colors.green,
                  splashColor: Colors.orangeAccent,
                  child: new Text("/"),
                  onPressed: () {
                  DivideNum();
                  },
                )
              ],
            ),
            new Padding(padding: const EdgeInsets.only(top: 40)),
            new Container(
              child:
              new MaterialButton(
                color: Colors.teal,
                splashColor: Colors.white,
                minWidth: 40,
                child: new Text("Clear Values"),
                onPressed: () {
                  clearFun();
                },
              ),
            ),
            new Padding(padding: const EdgeInsets.only(top: 40)),
            new Container(
              child: new Text("Output: $result"),
            )
          ],
        ),
      ),

    );
  }
}

    