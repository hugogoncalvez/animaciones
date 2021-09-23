import 'package:animaciones/src/widgets/boton_alto.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:animaciones/src/widgets/header_emergency.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class _ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  _ItemBoton(this.icon, this.texto, this.color1, this.color2);
}

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = <_ItemBoton>[
      new _ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new _ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new _ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new _ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      new _ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new _ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new _ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new _ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      new _ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new _ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new _ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new _ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
    ];

    List<Widget> itemMap = items
        .map(
          (item) => FadeInLeft(
            duration: Duration(milliseconds: 500),
            child: BotonAlto(
              texto: item.texto,
              color1: item.color1,
              color2: item.color2,
              icono: item.icon,
              onPressed: () {
                print('hola');
              },
            ),
          ),
        )
        .toList();
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: height * 0.29),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              //  SizedBox(height: height * 0.05),
              ...itemMap,
            ],
          ),
        ),
        _Encabezado()
      ],
    ));
  }
}

class _Encabezado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        IconHeader(
          icono: FontAwesomeIcons.plus,
          subTitulo: 'Haz Solicitado',
          titulo: 'Asistencia Médica',
          color1: Color(0xff526bF6),
          color2: Color(0xff67acf2),
        ),
        Positioned(
            right: 0,
            top: height * 0.055,
            child: RawMaterialButton(
              onPressed: () {},
              shape: CircleBorder(),
              padding: EdgeInsets.all(height * 0.0005),
              child: FaIcon(
                FontAwesomeIcons.ellipsisV,
                color: Colors.white,
              ),
            ))
      ],
    );
  }
}



// 
