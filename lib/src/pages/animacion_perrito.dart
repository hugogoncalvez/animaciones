import 'package:animaciones/src/widgets/radial_progress_perrito.dart';
import 'package:flutter/material.dart';

class AnimacionPage extends StatefulWidget {
  const AnimacionPage({Key? key}) : super(key: key);

  @override
  _AnimacionesPageState createState() => _AnimacionesPageState();
}

class _AnimacionesPageState extends State<AnimacionPage> {
  double porcentaje = 0.0;
  final Color colorPrimario = Colors.white;
  final Color colorSecundario = Colors.white;
  final double grosorLineaPregress = 18.0;
  final double grosorLineaFondo = 18.0;
  final double widthContainer = double.infinity;
  // final double heigthContainer = double.infinity;
  late bool iniciarAnimacion = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     porcentaje = 100;

        //     iniciarAnimacion = true;
        //     setState(() {});
        //   },
        //   child: Icon(Icons.refresh),
        // ),
        body: Center(
      child: GestureDetector(
        onTap: () {
          porcentaje = 100;

          iniciarAnimacion = true;
          setState(() {});
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomRadialProgress(
              widthContainer: widthContainer,
              // heigthContainer: heigthContainer,
              porcentaje: porcentaje,
              colorPrimario: colorPrimario,
              colorSecundario: colorSecundario,
              grosorLineaFondo: grosorLineaFondo,
              grosorLineaPregress: grosorLineaPregress,
              iniciarAnimacion: iniciarAnimacion,
            ),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              color: Colors.red,
              child: Text(
                'WALK THE DOG',
                style: TextStyle(fontSize: 50, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class CustomRadialProgress extends StatelessWidget {
  const CustomRadialProgress({
    Key? key,
    required this.widthContainer,
    // required this.heigthContainer,
    required this.porcentaje,
    required this.colorPrimario,
    required this.grosorLineaFondo,
    required this.grosorLineaPregress,
    required this.iniciarAnimacion,
    required this.colorSecundario,
  }) : super(key: key);

  final double widthContainer;
  // final double heigthContainer;
  final double porcentaje;
  final Color colorPrimario;
  final double grosorLineaFondo;
  final double grosorLineaPregress;
  final bool iniciarAnimacion;
  final Color colorSecundario;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      padding: EdgeInsets.all(10),
      width: widthContainer,
      //height: heigthContainer,
      child: RadialProgresPerrito(
        porcentaje: porcentaje,
        colorPrimario: colorPrimario,
        colorSecundario: colorSecundario,
        grosorLineaFondo: grosorLineaFondo,
        grosorLineaPregress: grosorLineaPregress,
        iniciarAnimacion: iniciarAnimacion,
      ),
    );
  }
}
