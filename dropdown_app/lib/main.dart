import 'package:flutter/material.dart';

void main()=>runApp(MaterialApp(
  title: "Drop Down Example",
  theme: ThemeData.dark(),
  home: DropDown(),
),
);
class DropDown extends StatefulWidget {

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  List<DropdownMenuItem<String>> dropdown=List();


  bool disabled=true;
  String choice="";
  final pythonchoice= {
    "1": "Web Development",
    "2": "Machine Learning",
    "3": "IOT",
  };
  final javachoice= {
    "1": "Android",
    "2": "Haddop",
    "3": "Security"
  };
  final cchoice= {
    "1": "Games",
    "2": "Embeded System",
    "3": "Competitive Programming"
  };

  //Show app
  void show_application(value)
  {
    setState(() {
      choice=value;
      disabled=false;
    });
  if(choice=="Python")
    {
      dropdown=[];
      for(String choice in pythonchoice.keys)
      dropdown.add(DropdownMenuItem(
          child:Text(pythonchoice[choice]),
      value: pythonchoice[choice],)
      );
    }
  else if(choice=="Java")
    {
      dropdown=[];
      for(String choice in javachoice.keys)
        {
          dropdown.add(DropdownMenuItem(
              child:Text(javachoice[choice]),
            value:javachoice[choice],
            ),
          );
        }
    }
  else if(choice=="Cpp"){
    dropdown=[];
    for(String choice in cchoice.keys)
      {
        dropdown.add(DropdownMenuItem(
            value: cchoice[choice],
            child: Text(cchoice[choice]))
        );
      }
  }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drop Down "),

      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              DropdownButton<String>(
                hint: Text("Select Language"),

                items:[
                    DropdownMenuItem(
                        value: "Python",child: Center(
                      child: Text("Python"),
                    )),
                    DropdownMenuItem(
                        value: "Java"
                        ,child: Center(
                      child: Text("Java"),
                    )),
                    DropdownMenuItem(
                        value: "Cpp"
                        ,child: Center(
                      child: Text("Cpp",),
                    ))
                  ] ,
                      onChanged: (value) {
                          show_application(value);
                      },

              ),
              Text("$choice"),
              DropdownButton(
                hint: Text("Select Language"),

                items:dropdown,
                onChanged: disabled?null:(value){

                },

              )
            ],
          ),
        ),
      ),
    );
  }
}
