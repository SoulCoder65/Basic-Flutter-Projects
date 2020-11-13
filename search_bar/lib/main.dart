
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main()=>runApp(MaterialApp(
  title: "Search Bar",
  home: new SearchBar(),
));

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {

  Widget title=Text("AppBar");
  Icon search=Icon(Icons.search);
  void switchToSearch()
  {
    setState(() {
      if(this.search.icon==Icons.search)
        {
        search=Icon(Icons.cancel);
          title=TextField();
        }
      else{
        search=Icon(Icons.search);
        title=Text("AppBar");
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
        elevation: 20,
        actions: [
          IconButton(icon: Icon(Icons.vertical_align_bottom), onPressed: null),
          IconButton(icon: search, onPressed: () {
            switchToSearch();
          },)
        ],

      ),
    );
  }
}
