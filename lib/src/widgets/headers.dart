import 'dart:ui';

import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615AAB),
    );
  }
}

class BordesRedondeados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
          color: Color(0xff615AAB),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(70),
              bottomRight: Radius.circular(70))),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      //color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint(); // lapiz para dibujar
    //propiedades del lapiz
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // solo bordes
    lapiz.strokeWidth = 2;

    final path = new Path();

    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    // path.lineTo(0, size.height * 0.5);  no hace falta

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw true;
  }
}

class HeaderTriangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      //color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderTrianguloPainter(),
      ),
    );
  }
}

class _HeaderTrianguloPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint(); // lapiz para dibujar
    //propiedades del lapiz
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // solo bordes
    lapiz.strokeWidth = 20;

    final path = new Path();

    // path.moveTo(0, size.height * 0.50);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width,
        0); // Cambiando esta linea se pinta la parte de arriba o abajo
    //path.lineTo(0, 0);
    // path.lineTo(0, size.height * 0.5);  no hace falta

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw true;
  }
}

class HeaderCurvo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      //color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderCurvo(),
      ),
    );
  }
}

class _HeaderCurvo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint(); // lapiz para dibujar
    //propiedades del lapiz
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // solo bordes
    lapiz.strokeWidth = 20;

    final path = new Path();
    path.lineTo(0, size.height * .25);
    path.quadraticBezierTo(
        size.width * .5, size.height * .4, size.width, size.height * .25);
    path.lineTo(size.width, 0);
    // path.lineTo(size.width, size.height * .25);
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw true;
  }
}

class HeaderWaves extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      //color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderWaves(),
      ),
    );
  }
}

class _HeaderWaves extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint(); // lapiz para dibujar
    //propiedades del lapiz
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // solo bordes
    lapiz.strokeWidth = 20;

    final path = new Path();
    path.lineTo(0, size.height * .25);
    path.quadraticBezierTo(size.width * .25, size.height * .27, size.width * .5,
        size.height * .20);
    path.quadraticBezierTo(
        size.width * .75, size.height * .14, size.width, size.height * .20);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw true;
  }
}

class HeaderWavesGradienteAbajo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      //color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderWavesGradienteAbajo(),
      ),
    );
  }
}

class _HeaderWavesGradienteAbajo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Gradient gradiente = new LinearGradient(
        // begin: Alignment.bottomLeft,
        // end: Alignment.topRight,
        colors: [
          Color(0xff6d05e8),
          Color(0xffc006ff),
          Color(0xff6d05fa),
        ], stops: [
      0.0,
      0.4,
      1,
    ]);

    final Rect rect = new Rect.fromCircle(
      center: Offset(165.0, 55.0),
      radius: 180,
    );

    final lapiz = Paint()
      ..shader = gradiente.createShader(rect); // lapiz para dibujar
    //propiedades del lapiz
    //lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // solo bordes
    lapiz.strokeWidth = 20;

    final path = new Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * .8);

    path.quadraticBezierTo(
        size.width * .25, size.height * .7, size.width * .5, size.height * .8);
    path.quadraticBezierTo(
        size.width * .75, size.height * .90, size.width, size.height * .8);

    path.lineTo(size.width, size.height);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw true;
  }
}

class HeaderWavesAbajo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      //color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderWavesAbajo(),
      ),
    );
  }
}

class _HeaderWavesAbajo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint(); // lapiz para dibujar
    //propiedades del lapiz
    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // solo bordes
    lapiz.strokeWidth = 20;

    final path = new Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * .8);

    path.quadraticBezierTo(
        size.width * .25, size.height * .7, size.width * .5, size.height * .8);
    path.quadraticBezierTo(
        size.width * .75, size.height * .90, size.width, size.height * .8);

    path.lineTo(size.width, size.height);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw true;
  }
}
