import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
void main()=>runApp(new MaterialApp(
  title: "Internet Connectivity",
  theme: ThemeData.light(),
  home: InterNet(),
));

class InterNet extends StatefulWidget {
  @override
  _InterNetState createState() => _InterNetState();
}

class _InterNetState extends State<InterNet> {
  String status="Check Internet..";
  void checkInternetFun () async
  {
    //Socket Method
    // try{
    //   var internet=await InternetAddress.lookup("google.com");
    //   if(internet.isNotEmpty && internet[0].rawAddress.isNotEmpty)
    //     {
    //       print(internet[0]);
    //       setState(() {
    //         status="Connected";
    //       });
    //     }
    // }
    // on SocketException catch (e)
    // {
    //   print("${e} Error");
    //   setState(() {
    //     status="Not Connected";
    //   });
    // }

  //  Connectivity Package
  // var internet=await (Connectivity().checkConnectivity());
  // if(internet==ConnectivityResult.none)
  //   {
  //     print(internet);
  //     status="Not Connected";
  //   }
  // else if(internet==ConnectivityResult.mobile)
  //   {
  //     print(internet);
  //     status="Mobile Connected";
  //   }
  // else{
  //   print(internet);
  //   status="Wifi";
  // }

  }
  //  Third method for continously checking internet connectivity
  StreamSubscription subscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subscription=Connectivity().onConnectivityChanged.listen((ConnectivityResult res)
    {
      if(res==ConnectivityResult.none)
        {
          setState(() {
            status="Not Connected";
          });
        }
      else {
        if(res==ConnectivityResult.mobile)
          {
            setState(() {
              status="Mobile";
            });
          }
        else{
          setState(() {
            status="Wifi";
          });
        }
      }
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    subscription.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Internet Connectivity Checker"),
        leading: Icon(Icons.signal_cellular_connected_no_internet_4_bar),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(status),
              ElevatedButton(onPressed: () {
                  checkInternetFun();
              }, child: Text("Check"))
            ],
          ),
        ),
      ),
    );
  }
}
