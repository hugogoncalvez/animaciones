import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgres extends StatefulWidget {
  final double porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorLineaFondo;
  final double grosorLineaPregress;

  const RadialProgres(
      {required this.porcentaje,
      this.colorPrimario = Colors.blue,
      this.colorSecundario = Colors.grey,
      this.grosorLineaFondo = 4,
      this.grosorLineaPregress = 4});
  @override
  _RadialProgresState createState() => _RadialProgresState();
}

class _RadialProgresState extends State<RadialProgres>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late double porcentajeAnterior;

  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0);

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;
    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext contex, child) {
          return Container(
            color: Colors.transparent,
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: _MiRadialProgress(
                  (widget.porcentaje - diferenciaAnimar) +
                      (diferenciaAnimar * controller.value),
                  widget.colorPrimario,
                  widget.colorSecundario,
                  widget.grosorLineaFondo,
                  widget.grosorLineaPregress),
            ),
          );
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
      Colors.red,
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
      //..color = colorPrimario  //  si se quiere de un color
      ..shader = gradiente.createShader(rect) // si se quiere con un gradiente
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
