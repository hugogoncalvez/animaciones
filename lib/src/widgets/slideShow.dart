import 'package:flutter/material.dart';

import 'package:animaciones/src/models/slider_model.dart';

import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrincipal;
  final Color colorSecundario;

  const Slideshow(
      {required this.slides,
      required this.puntosArriba,
      required this.colorPrincipal,
      required this.colorSecundario});

  @override
  Widget build(BuildContext context) {
    final int puntos = slides.length;

    return ChangeNotifierProvider(
      create: (_) => SliderModel(),
      child: SafeArea(
        child: Center(
            child: Column(
          children: [
            if (puntosArriba) _Dots(puntos, colorPrincipal, colorSecundario),
            Expanded(child: _Slides(this.slides)),
            if (!puntosArriba) _Dots(puntos, colorPrincipal, colorSecundario),
          ],
        ) //,
            ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  final int puntos;
  final Color colorPrincipal;
  final Color colorSecundario;

  const _Dots(this.puntos, this.colorPrincipal, this.colorSecundario);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            puntos, (index) => _Dot(index, colorPrincipal, colorSecundario)),
        // children: [
        //   if (puntos >= 1) _Dot(0),
        //   if (puntos >= 2) _Dot(1),
        //   if (puntos >= 3) _Dot(2),
        //   if (puntos >= 4) _Dot(3),
        //   if (puntos >= 5) _Dot(4),
        // ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  final Color colorPrincipal;
  final Color colorSecundario;
  _Dot(this.index, this.colorPrincipal, this.colorSecundario);
  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
      width: 12,
      height: 12,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5)
            ? Colors.orange
            : Colors.grey,
        shape: BoxShape.circle,
      ),
      duration: Duration(milliseconds: 200),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      // actulizar al Provider
      Provider.of<SliderModel>(context, listen: false).currentPage =
          pageViewController.page!;
    });
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide,
    );
  }
}
