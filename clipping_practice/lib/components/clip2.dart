import 'package:flutter/material.dart';

class Clip2 extends StatefulWidget {
  @override
  _Clip2State createState() => _Clip2State();
}

class _Clip2State extends State<Clip2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipPath(
              child: Image.network("https://picsum.photos/id/1000/400/400"),
              clipper: new CliperThree(),
            )
            
          ],
        ),
      ),
    );
  }
}

class CliperThree extends CustomClipper<Path>
{
  @override
  Path getClip(Size size)
  {
    Path path=new Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width*0.1,size.height*0.8 );
    path.lineTo(size.width*0.2, size.height);
    path.lineTo(size.width*0.3, size.height*0.8);
    path.lineTo(size.width*0.4, size.height);
    path.lineTo(size.width*0.5, size.height*0.8);
    path.lineTo(size.width*0.6, size.height);
    path.lineTo(size.width*0.7, size.height*0.8);
    path.lineTo(size.width*0.8, size.height);
    path.lineTo(size.width*0.9, size.height*0.8);


    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;


  }
@override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) =>false;


}