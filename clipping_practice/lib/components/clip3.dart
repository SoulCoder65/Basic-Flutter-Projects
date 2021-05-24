import "package:flutter/material.dart";

class Clip3 extends StatefulWidget {
  @override
  _Clip3State createState() => _Clip3State();
}

class _Clip3State extends State<Clip3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: ClipPath(
            clipper: MyClipper(),
            child: Image.network("https://picsum.photos/id/237/400/300"),
          ),
        ),
      ),
    );
  }
}

    
class MyClipper extends CustomClipper<Path>
{
  @override
  Path getClip(Size size)
  {
    Path path =new Path();

    path.lineTo(0.0, size.height-40);
    var firstEndPoint=Offset(size.width/2.25+40, size.height-10);
    var firstControlPoint=Offset(size.width/3.3, size.height-70);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint=Offset(size.width,size.height-50);
    var secondControlPont=Offset(size.width-60,size.height );
    path.quadraticBezierTo(secondControlPont.dx,secondControlPont.dy,secondEndPoint.dx,secondEndPoint.dy);

    // path.lineTo(size.width, size.height/2+50);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) =>false;
}
