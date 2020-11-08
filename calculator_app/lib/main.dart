import 'dart:math';

import 'package:flutter/material.dart';

void main()=>runApp(MaterialApp(
  title: "Calculator",
  theme: ThemeData.dark(),
  home: CalculatorApp(),
  
));

class CalculatorApp extends StatefulWidget {
  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String textTodisplay="";
   var result;
   int num1;
   int num2;
   String operator;
   void PerformOper(String val)
  {
    if(val=="+"||val=="-"||val=="X"||val=="/")
        {
          num1=int.parse(textTodisplay);
          operator=val;
          result="";
        }
    else if(val=="=")
      {
        num2=int.parse(textTodisplay);
        result="";
        if(operator=="+")
          {
            result=(num1+num2).toString();
          }
        else if(operator=="-")
        {
          result=(num1-num2).toString();
        }
        else if(operator=="X")
        {
          result=(num1*num2).toString();
        }
        else{
            result=(num1~/num2).toString();

        }
      }
    else if(val=="C")
      {
        result="";
        num1=0;
        num2=0;
      }
    else{

      result=int.parse(textTodisplay+val).toString();

    }
    setState(() {
      textTodisplay=result;
    });
  }

  Widget CreateBtn(String val)
  {
    return Expanded(
        child: OutlineButton(
          onPressed: () => PerformOper(val) ,
          child: Text("$val"),

        ) );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calcultor"),
        leading: Icon(Icons.calculate),
        centerTitle: true,

      ),
    body:Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(

              child:Container(
                alignment: Alignment.bottomRight,
                child: Text("$textTodisplay",style: TextStyle(
                  color:Colors.yellowAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontFamily: "cursive",

                ),),
              ) ),
          Row(
            children: <Widget>[
              CreateBtn("1"),
              CreateBtn("2"),
              CreateBtn("3"),
              CreateBtn("+"),
            ],
          ),
          Row(
            children: <Widget>[
              CreateBtn("4"),
              CreateBtn("5"),
              CreateBtn("6"),
              CreateBtn("-"),
            ],
          ),
          Row(
            children: <Widget>[
              CreateBtn("7"),
              CreateBtn("8"),
              CreateBtn("9"),
              CreateBtn("X"),

            ],
          ),
          Row(
            children: <Widget>[
              CreateBtn("C"),
              CreateBtn("0"),
              CreateBtn("="),
              CreateBtn("/"),

            ],
          ),
        ],
      ),
    ),
    );



  }
}
