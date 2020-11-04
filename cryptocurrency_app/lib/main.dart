import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//Main Fun
void main()=>runApp(new MaterialApp(
  title: "Crypto Currency Stats",
  theme: new ThemeData(
    primarySwatch: Colors.deepPurple,
  ),
  home: new CryptoApp(),
));

//Main Crpto App Widgets
class CryptoApp extends StatefulWidget {
  @override
  _CryptoAppState createState() => _CryptoAppState();
}

class _CryptoAppState extends State<CryptoApp> {
  Map<String, dynamic> Response;

  //Declaring Variables
  List<dynamic> data;
  final List<MaterialColor> _colors = [Colors.red, Colors.blue, Colors.green];
  final String api_key = "b8158318-8508-41cc-87db-922000eecd0b";

  //Init Method
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._getApiResponse();
  }

  //Defining Future Function
  Future<List> _getApiResponse() async
  {
    var url = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=b8158318-8508-41cc-87db-922000eecd0b";
    http.Response result = await http.get(url);
    Map<String, dynamic> map = json.decode(result.body);
    List<dynamic> data = map["data"];
    return data;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Crypto Currency App", style: new TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),),
        centerTitle: true,
        shadowColor: Colors.lightBlueAccent,
      ),
      body: _HomeWidget(),
    );
  }

  Widget _HomeWidget() {
    return FutureBuilder(
        builder: (context, snapshot) {
          print(snapshot.data[2]);

          return Container(
            child: Column(
              children: <Widget>[
                new Flexible(
                    child: new ListView.builder(
                        itemBuilder: (context, index) {
                          final Map currency = snapshot.data[index];
                          final MaterialColor colors = _colors[index %
                              _colors.length];
                          return _getListItems(currency, colors);
                        },
                        itemCount: snapshot.data == null ? 0 : snapshot.data
                            .length)),
              ],
            ),
          );
        }, future: _getApiResponse());
  }

  ListTile _getListItems(Map currency, MaterialColor colors) {
    return new ListTile(
      contentPadding: EdgeInsets.all(4),
      leading: new CircleAvatar(
        backgroundColor: colors,
        child: new Text(currency["name"][0]),
      ),
      title: new Text(currency["name"]),

      subtitle: _getSubtitle((currency["quote"]["USD"]["price"].toString()),
          (currency["quote"]["USD"]["percent_change_1h"].toString())),
      trailing: new Icon(Icons.send),
    );
  }

  Widget _getSubtitle(String price, String percentage) {
    String per=double.parse(price).toStringAsFixed(3);
    TextSpan priceWidget = new TextSpan(
      text: "\$$per", style: new TextStyle(
      color: Colors.teal,
      fontWeight: FontWeight.bold,

    ),
    );
    String percentageChange = "1 Hour: $percentage\n";
    TextSpan percentChangeWidget;

    if (double.parse(percentage) > 0) {
      percentChangeWidget = new TextSpan(
          text: percentageChange,
          style: new TextStyle(
              color: Colors.green
          )
      );
    }
    else {
      percentChangeWidget = new TextSpan(
          text: percentageChange,
          style: new TextStyle(
              color: Colors.red
          )
      );
    }
    return new RichText(

      text: new TextSpan(
        children: [priceWidget, percentChangeWidget],


      ),
    );
  }
}