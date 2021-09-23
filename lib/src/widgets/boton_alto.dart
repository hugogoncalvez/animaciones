import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonAlto extends StatelessWidget {
  final IconData icono;
  final String texto;
  final Color color1;
  final Color color2;
  final VoidCallback onPressed;

  const BotonAlto(
      {this.icono = FontAwesomeIcons.ad,
      required this.texto,
      this.color1 = const Color(0xff6989f5),
      this.color2 = const Color(0xff906ef5),
      required this.onPressed});
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        children: [
          _BotonBackground(
            color1: color1,
            color2: color2,
            icono: icono,
          ),
          _ContenidoBoton(height: height, icono: icono, texto: texto)
        ],
      ),
    );
  }

  toList() {}
}

class _ContenidoBoton extends StatelessWidget {
  const _ContenidoBoton({
    Key? key,
    required this.height,
    required this.icono,
    required this.texto,
  }) : super(key: key);

  final double height;
  final IconData icono;
  final String texto;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: height * 0.05, height: height * 0.15),
        FaIcon(icono, size: height * 0.045, color: Colors.white),
        SizedBox(width: height * 0.03),
        Expanded(
          child: Text(texto,
              style: TextStyle(color: Colors.white, fontSize: height * 0.027)),
        ),
        FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white),
        SizedBox(
          width: height * 0.04,
        )
      ],
    );
  }
}

class _BotonBackground extends StatelessWidget {
  final Color color1;
  final Color color2;
  final IconData icono;

  const _BotonBackground(
      {Key? key,
      required this.color1,
      required this.color2,
      required this.icono})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.all(height * 0.02),
      width: double.infinity,
      height: height * 0.12,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(4, 6),
                blurRadius: 10)
          ],
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(colors: [color1, color2])),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
                right: -height * 0.02,
                top: -height * 0.025,
                child: FaIcon(
                  icono,
                  size: height * 0.15,
                  color: Colors.white.withOpacity(0.2),
                ))
          ],
        ),
      ),
    );
  }
}
