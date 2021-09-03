import 'package:animaciones/src/pages/animacion_perrito.dart';
import 'package:animaciones/src/pages/slideshow_page.dart';
import 'package:animaciones/src/retos/cuadrado_animado_page.dart';
import 'package:flutter/material.dart';
import 'package:animaciones/src/pages/graficas_circulares_page.dart';

import 'package:animaciones/src/Labs/circular_progress_page.dart';
import 'package:animaciones/src/pages/animaciones_page.dart';
import 'package:animaciones/src/pages/headers_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Curso Diseño',
      home: AnimacionPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
