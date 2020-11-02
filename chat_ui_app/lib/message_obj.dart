import 'package:flutter/material.dart';

const _name="Akshay";

class MessageObj extends StatelessWidget {
  final String text;
  MessageObj({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget> [
          new Container(
            margin: const EdgeInsets.only(right: 10),
            child: new CircleAvatar(
              child: new Text(
                _name[0]
              ),
            ),
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget> [
            new Text(_name,style: Theme.of(context).textTheme.subtitle1),
              new Container(
                margin: const EdgeInsets.only(top: 5),
                child: new Text(text),
              )
            ],
          )
        ],
      ),
    );
  }
}
