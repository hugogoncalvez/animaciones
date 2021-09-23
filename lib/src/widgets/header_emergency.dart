import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeader extends StatelessWidget {
  final IconData icono;
  final String titulo;
  final String subTitulo;
  final Color? color1;
  final Color? color2;

  const IconHeader(
      {Key? key,
      required this.icono,
      required this.titulo,
      required this.subTitulo,
      this.color1 = const Color(0xff526bF6),
      this.color2 = const Color(0xff67acf2)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final Color colorBlanco = Colors.white;
    return Stack(
      children: [
        _IconHeaderBackGround(
          color1: color1,
          color2: color2,
        ),
        Positioned(
            top: -height * 0.06,
            left: -height * 0.065,
            child: FaIcon(
              icono,
              size: height * 0.25,
              color: Colors.white.withOpacity(0.2),
            )),
        Column(
          children: [
            SizedBox(
              height: height * 0.07,
              width: double.infinity,
            ),
            Text(
              subTitulo,
              style: TextStyle(
                  fontSize: height * 0.03, color: colorBlanco.withOpacity(0.7)),
            ),
            SizedBox(height: height * 0.02),
            Text(titulo,
                style: TextStyle(
                    fontSize: height * 0.035,
                    color: colorBlanco,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: height * 0.02),
            FaIcon(
              icono,
              color: colorBlanco,
              size: height * 0.1,
            )
          ],
        )
      ],
    );
  }
}

class _IconHeaderBackGround extends StatelessWidget {
  final Color? color1;
  final Color? color2;

  const _IconHeaderBackGround({this.color1, this.color2});
  @override
  Widget build(BuildContext context) {
     final double height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: height * 0.35,
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [color1!, color2!])),
    );
  }
}
