import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';

class CircularProgressPage extends StatefulWidget {
  const CircularProgressPage({Key? key}) : super(key: key);

  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage>
    with SingleTickerProviderStateMixin {
  //
  late AnimationController controller;

  double porcentaje = 0.0;
  double nuevoPorcentaje = 0.0;

  @override
  void initState() {
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 800));

    controller.addListener(() {
      //print('valor controller: ${controller.value}');
      setState(() {
        porcentaje = lerpDouble(porcentaje, nuevoPorcentaje, controller.value)!;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.didUnregisterListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            porcentaje = nuevoPorcentaje;
            nuevoPorcentaje += 10;

            if (nuevoPorcentaje > 100) {
              nuevoPorcentaje = 0;
              porcentaje = 0;
            }

            controller.forward(from: 0.0);
            setState(() {});
          },
          child: Icon(Icons.replay_outlined),
          backgroundColor: Colors.pink,
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Container(
              width: 300,
              height: 300,
              child: CustomPaint(painter: _MiRadialProgress(porcentaje)),
            ),
          ),
        ));
  }
}

class _MiRadialProgress extends CustomPainter {
  //
  final porcentaje;

  _MiRadialProgress(this.porcentaje);

  @override
  void paint(Canvas canvas, Size size) {
    //circulo completado
    final paint = new Paint()
      ..strokeWidth = 4
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final Offset center = new Offset(size.width * 0.5, size.height * 0.5);

    final double radio = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radio, paint);

    // Arco

    final paintArco = new Paint()
      ..strokeWidth = 4
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;

    // parte que se debera ir llenado, 2 * pi es todo un circulo

    double arcAngule = 2 * pi * (porcentaje / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radio), -pi / 2,
        arcAngule, false, paintArco);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
