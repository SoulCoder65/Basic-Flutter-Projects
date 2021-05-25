import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Web Socket Example",
      home: WebSocketExample(
        channel: new IOWebSocketChannel.connect("wss://echo.websocket.org"),
      ),
    );
  }
}

class WebSocketExample extends StatefulWidget {
  final WebSocketChannel channel;
  WebSocketExample({@required this.channel});
  @override
  _WebSocketExampleState createState() => _WebSocketExampleState();
}

class _WebSocketExampleState extends State<WebSocketExample> {
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Enter Data....",
                  ),
                  controller: name,
                ),
              ),
              StreamBuilder(
                stream:widget.channel.stream,
                builder: (context, snapshot) {
                  return new Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(snapshot.hasData ? '${snapshot.data}' : ''),
                  );
                },
              ),

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
        onPressed: _sendMessage,
      ),
    );
  }

  void _sendMessage(){

    if(name.text.isNotEmpty)
      {
        print("hello");
       widget.channel.sink.add(name.text);
      }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    widget.channel.sink.close();
    super.dispose();
  }
}
