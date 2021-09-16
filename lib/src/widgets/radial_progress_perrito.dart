import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RadialProgresPerrito extends StatefulWidget {
  final double porcentaje;
  Color colorPrimario;
  Color colorSecundario;
  final double grosorLineaFondo;
  final double grosorLineaPregress;
  final bool iniciarAnimacion;

  RadialProgresPerrito(
      {required this.porcentaje,
      required this.colorPrimario,
      required this.colorSecundario,
      required this.grosorLineaFondo,
      required this.grosorLineaPregress,
      required this.iniciarAnimacion});
  @override
  _RadialProgresStatePerrito createState() => _RadialProgresStatePerrito();
}

class _RadialProgresStatePerrito extends State<RadialProgresPerrito>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late double porcentajeAnterior;

  IconData icon = FontAwesomeIcons.dog;
  Color colorIcono = Colors.black;
  double sizeIcono = 120.0;

  Color colorFondo = Colors.white;

  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));

    controller.addListener(() async {
      if (controller.status == AnimationStatus.forward) {
        icon = FontAwesomeIcons.dog;
        colorIcono = Colors.white;
        colorFondo = Colors.red;

        widget.colorSecundario = Colors.black38;
      }
      if (controller.status == AnimationStatus.completed) {
        icon = FontAwesomeIcons.check;
        colorIcono = Colors.black;
        colorFondo = Colors.white;
        widget.colorSecundario = Colors.white;

        await Future.delayed(Duration(milliseconds: 700));
        icon = FontAwesomeIcons.dog;
        colorIcono = Colors.black;
        porcentajeAnterior = 0;

        controller.reset();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.iniciarAnimacion) {
      controller.forward();
    }
    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;
    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext contex, child) {
          return Stack(alignment: Alignment.center, children: [
            Container(
                width: 300,
                height: 320,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: colorFondo),
                child: Center(
                    child: FaIcon(icon, size: sizeIcono, color: colorIcono))),
            Container(
              width: 300,
              height: 320,
              child: CustomPaint(
                painter: _MiRadialProgress(
                    (widget.porcentaje - diferenciaAnimar) +
                        (diferenciaAnimar * controller.value),
                    widget.colorPrimario,
                    widget.colorSecundario,
                    widget.grosorLineaFondo,
                    widget.grosorLineaPregress),
              ),
            ),
          ]);
        });
  }
}

class _MiRadialProgress extends CustomPainter {
  //
  final porcentaje;
  final colorPrimario;
  final colorSecundario;
  final grosorLineaFondo;
  final grosorLineaProgress;

  _MiRadialProgress(this.porcentaje, this.colorPrimario, this.colorSecundario,
      this.grosorLineaFondo, this.grosorLineaProgress);

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = new Rect.fromCircle(center: Offset(0, 0), radius: 180);

    final Gradient gradiente = new LinearGradient(colors: [
      Color(0xffC012FF),
      Color(0xFF6D05E8),
      Colors.blue,
    ]);
    //circulo completado
    final paint = new Paint()
      ..strokeWidth = grosorLineaFondo
      ..color = colorSecundario
      ..style = PaintingStyle.stroke;

    final Offset center = new Offset(size.width * 0.5, size.height * 0.5);

    final double radio = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radio, paint);

    // Arco

    final paintArco = new Paint()
      ..strokeWidth = grosorLineaProgress
      ..color = colorPrimario //  si se quiere de un color
      // ..shader = gradiente.createShader(rect) // si se quiere con un gradiente
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // parte que se debera ir llenado, 2 * pi es todo un circulo

    double arcAngule = 2 * pi * (porcentaje / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radio), -pi / 2,
        arcAngule, false, paintArco);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
