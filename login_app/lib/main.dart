import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new LoginApp(),

    );
  }
}
class LoginApp extends StatefulWidget  {

  @override
  _LoginAppState createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> with SingleTickerProviderStateMixin{
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;
  @override
  void initState()
  {
    super.initState();
    _iconAnimationController=new AnimationController(
        vsync: this,
        duration: new Duration(milliseconds: 500)

    );
    _iconAnimation=new CurvedAnimation(
        parent: _iconAnimationController,
        curve: Curves.easeInOutQuint
    );
    _iconAnimation.addListener(()=>this.setState(() {

    }));
    _iconAnimationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.green,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
              image: new AssetImage("assets/ironman.jpg"),
              fit: BoxFit.cover,
              color:Colors.black87,
            colorBlendMode: BlendMode.luminosity,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new FlutterLogo(

                size: _iconAnimation.value*100,
              ),
              new Form(
                child:new Theme(
                      data: new ThemeData(
                              brightness: Brightness.dark,
                              primarySwatch: Colors.teal,
                              inputDecorationTheme: new InputDecorationTheme(
                                        labelStyle: new TextStyle(
                                        fontSize: 30,
                                        color: Colors.teal
                                        ),
                              ),
                                        ), child: new Container(
                                   padding: const EdgeInsets.all(40),

                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                children:<Widget>[
                  new TextFormField(
                    decoration: new InputDecoration(
                      hintText: "Enter Your Email",

                    ),
                    keyboardType: TextInputType.emailAddress,

                  ),
                  new Padding(padding: const EdgeInsets.all(10)),

                  new TextFormField(
                          decoration: new InputDecoration(
                            hintText: "Enter Your Password",
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                  ),
                   new Padding(
                       padding: const EdgeInsets.all(10)
                   ),
                    new MaterialButton(
                        height: 40,
                        minWidth: 130,
                        color: Colors.teal,
                        textColor: Colors.white,
                        splashColor: Colors.blueAccent,
                        child: new Icon(Icons.login),
                        onPressed: ()=>{

                    })
    ]

              ),))
              )
            ],
          )

        ],
      ),
    );
  }
}
