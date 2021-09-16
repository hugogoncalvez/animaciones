import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class BottomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        child: Stack(children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: CustomPaint(
              size: Size(size.width,
                  (80).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
              painter: RPSCustomPainter(),
            ),
          ),
        ]),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.0012500, size.height);
    path_0.lineTo(size.width * 0.0006000, size.height * 0.2521000);
    path_0.quadraticBezierTo(size.width * 0.2345250, size.height * 0.1380250,
        size.width * 0.3125000, size.height * 0.1000000);
    path_0.cubicTo(
        size.width * 0.3750875,
        size.height * 0.0522500,
        size.width * 0.3759625,
        size.height * 0.1521500,
        size.width * 0.3758875,
        size.height * 0.2500000);
    path_0.cubicTo(
        size.width * 0.3748375,
        size.height * 0.8984500,
        size.width * 0.6256000,
        size.height * 0.8947000,
        size.width * 0.6258875,
        size.height * 0.2500000);
    path_0.cubicTo(
        size.width * 0.6253875,
        size.height * 0.1521500,
        size.width * 0.6250750,
        size.height * 0.0558500,
        size.width * 0.6880250,
        size.height * 0.1000000);
    path_0.quadraticBezierTo(size.width * 0.7660187, size.height * 0.1375000,
        size.width, size.height * 0.2500000);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(size.width * 0.0012500, size.height);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
