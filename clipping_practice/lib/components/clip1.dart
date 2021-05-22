import 'package:flutter/material.dart';

class Clip1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              child: ClipPath(
                clipper: new CliperOne(),
                child: Image.network("https://picsum.photos/400/250"),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ClipPath(
                clipper: new CliperTwo(),
                child: Image.network("https://picsum.photos/400/249"),
              ),
            )
          ],
        ) ,
      ),
    );
  }
}

class CliperOne extends CustomClipper<Path>{

  @override
  Path getClip(Size size) {
    Path path=new Path();
    path.lineTo(size.width,0.0);
     path.lineTo(size.width, size.height);
     path.lineTo(size.width/2, size.height/2);
     path.lineTo(0.0, size.height);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) =>false;

}

class CliperTwo extends CustomClipper<Path>{

  @override
  Path getClip(Size size) {
    Path path=new Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width/2, size.height/2);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) =>false;
}