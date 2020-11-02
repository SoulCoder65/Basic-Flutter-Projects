import 'package:flutter/material.dart';
import 'message_obj.dart';
class ChatWindow extends StatefulWidget {
  @override
  _ChatWindowState createState() => _ChatWindowState();
}

class _ChatWindowState extends State<ChatWindow> {
  final TextEditingController _fieldValue=new TextEditingController();
  final List<MessageObj> _messages=<MessageObj>[];

  void _sendMessageFun(String text)
  {
    _fieldValue.clear();
    MessageObj message=new MessageObj(
      text: text,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }
  Widget _textContainerWidget(){
    return new IconTheme(
      data: new IconThemeData(
        color: Colors.indigo,
        size: 50,
      ),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                decoration: new InputDecoration.collapsed(hintText: "Enter Message Here....."),
                controller: _fieldValue,
                onSubmitted: _sendMessageFun,
                style: new TextStyle(
                  color: Colors.white,
                ),
              ),

            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed:()=>_sendMessageFun(_fieldValue.text) ),
            )
          ],
        ),
      ),

    );
  }
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Flexible(
            child: new ListView.builder(
            padding: new EdgeInsets.all(8),
              reverse: true,
                itemBuilder: (_,int index)=>_messages[index],
              itemCount: _messages.length,
            ),
        ),
        new Divider(
          height: 1.0,

        ),
        new Container(
          decoration: new BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: _textContainerWidget(),
        )
      ],
    );
  }
}
