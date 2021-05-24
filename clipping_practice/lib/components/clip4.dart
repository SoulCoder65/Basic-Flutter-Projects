import "package:flutter/material.dart";

class Clip4 extends StatefulWidget {
  @override
  _Clip4State createState() => _Clip4State();
}

class _Clip4State extends State<Clip4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: ClipPath(
            clipper: MyClipper(),
            child: Image.network("https://picsum.photos/id/238/400/300"),
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
    var firstControlpoint=Offset(size.width/4, size.height);
    var firstEndpoint=Offset(size.width/2, size.height-40);
    path.quadraticBezierTo(firstControlpoint.dx,firstControlpoint.dy,firstEndpoint.dx,firstEndpoint.dy);

    var secondControlpoint=Offset(size.width/1.2, size.height-80);
    var secondEndpoint=Offset(size.width, size.height);
    path.quadraticBezierTo(secondControlpoint.dx, secondControlpoint.dy, secondEndpoint.dx, secondEndpoint.dy);
    path.lineTo(size.width, 0.0);

    path.close();
    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) =>false;
}
