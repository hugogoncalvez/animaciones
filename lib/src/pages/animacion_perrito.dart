import 'package:flutter/material.dart';

import 'package:animaciones/src/widgets/radial_progress.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AnimacionPage extends StatefulWidget {
  const AnimacionPage({Key? key}) : super(key: key);

  @override
  _AnimacionesPageState createState() => _AnimacionesPageState();
}

class _AnimacionesPageState extends State<AnimacionPage> {
  double porcentaje = 0.0;
  final Color colorPrimario = Colors.blue;
  final double grosorLineaPregress = 8.0;
  final double grosorLineaFondo = 3.0;
  final double widthContainer = double.infinity;
  final double heigthContainer = double.infinity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            porcentaje += 10;
            if (porcentaje > 100) {
              porcentaje = 0;
            }
            setState(() {});
          },
          child: Icon(Icons.refresh),
        ),
        body: Center(
          child: CustomRadialProgress(
              widthContainer: widthContainer,
              heigthContainer: heigthContainer,
              porcentaje: porcentaje,
              colorPrimario: Colors.red,
              grosorLineaFondo: grosorLineaFondo,
              grosorLineaPregress: grosorLineaPregress),
        ));
  }
}

class CustomRadialProgress extends StatelessWidget {
  const CustomRadialProgress({
    Key? key,
    required this.widthContainer,
    required this.heigthContainer,
    required this.porcentaje,
    required this.colorPrimario,
    required this.grosorLineaFondo,
    required this.grosorLineaPregress,
  }) : super(key: key);

  final double widthContainer;
  final double heigthContainer;
  final double porcentaje;
  final Color colorPrimario;
  final double grosorLineaFondo;
  final double grosorLineaPregress;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      padding: EdgeInsets.all(10),
      width: widthContainer,
      height: heigthContainer,
      child: Stack(alignment: Alignment.center, children: [
        Positioned(top: 50, left: 100, child: FaIcon(FontAwesomeIcons.dog)),
        RadialProgres(
          porcentaje: porcentaje,
          colorPrimario: colorPrimario,
          colorSecundario: Colors.blueGrey[300] as Color,
          grosorLineaFondo: grosorLineaFondo,
          grosorLineaPregress: grosorLineaPregress,
        ),
      ]),
    );
  }
}
