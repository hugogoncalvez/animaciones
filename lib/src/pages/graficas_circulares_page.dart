import 'package:animaciones/src/theme/theme_changer.dart';
import 'package:flutter/material.dart';

import 'package:animaciones/src/widgets/radial_progress.dart';
import 'package:provider/provider.dart';

class GraficasCircularesPage extends StatefulWidget {
  const GraficasCircularesPage({Key? key}) : super(key: key);

  @override
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double porcentaje = 0.0;
  final Color colorPrimario = Colors.blue;
  final double grosorLineaPregress = 8.0;
  final double grosorLineaFondo = 3.0;
  final double widthContainer = 150;
  final double heigthContainer = 150;

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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadialProgress(
                    widthContainer: widthContainer,
                    heigthContainer: heigthContainer,
                    porcentaje: porcentaje,
                    colorPrimario: Colors.red,
                    grosorLineaFondo: grosorLineaFondo,
                    grosorLineaPregress: grosorLineaPregress),
                CustomRadialProgress(
                    widthContainer: widthContainer,
                    heigthContainer: heigthContainer,
                    porcentaje: porcentaje,
                    colorPrimario: Colors.blue,
                    grosorLineaFondo: grosorLineaFondo,
                    grosorLineaPregress: grosorLineaPregress),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomRadialProgress(
                    widthContainer: widthContainer,
                    heigthContainer: heigthContainer,
                    porcentaje: porcentaje,
                    colorPrimario: Colors.purple,
                    grosorLineaFondo: grosorLineaFondo,
                    grosorLineaPregress: grosorLineaPregress),
                CustomRadialProgress(
                    widthContainer: widthContainer,
                    heigthContainer: heigthContainer,
                    porcentaje: porcentaje,
                    colorPrimario: Colors.pink,
                    grosorLineaFondo: grosorLineaFondo,
                    grosorLineaPregress: grosorLineaPregress),
              ],
            ),
          ],
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
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return Container(
      padding: EdgeInsets.all(10),
      width: widthContainer,
      height: heigthContainer,
      child: Stack(children: [
        RadialProgres(
          porcentaje: porcentaje,
          colorPrimario: colorPrimario,
          colorSecundario: appTheme.textTheme.bodyText1!.color as Color,
          grosorLineaFondo: grosorLineaFondo,
          grosorLineaPregress: grosorLineaPregress,
        ),
        Center(
          child: Text(
            '$porcentaje %',
            style: TextStyle(
                fontSize: 20,
                color: colorPrimario,
                fontWeight: FontWeight.bold),
          ),
        ),
      ]),
    );
  }
}
