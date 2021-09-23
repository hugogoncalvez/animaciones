import 'package:animaciones/src/theme/theme_changer.dart';
import 'package:animaciones/src/widgets/slideShow.dart';

import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final colorSheme = appTheme.currentTheme.colorScheme.secondary;
    bool isLarge;
    if (MediaQuery.of(context).size.height > 500) {
      isLarge = true;
    } else {
      isLarge = false;
    }

    final children = [
      _MiSlideShow(appTheme: appTheme, colorSheme: colorSheme),
      _MiSlideShow(appTheme: appTheme, colorSheme: colorSheme)
    ];

    return Scaffold(
        // backgroundColor: Colors.purple,
        // body: MiSlideshow(),
        body: (isLarge) ? Column(children: children) : Row(children: children));
  }
}

class _MiSlideShow extends StatelessWidget {
  const _MiSlideShow({
    Key? key,
    required this.appTheme,
    required this.colorSheme,
  }) : super(key: key);

  final ThemeChanger appTheme;
  final Color colorSheme;

  @override
  Widget build(BuildContext context) {
    return Slideshow(
      puntosArriba: false,
      colorPrimario: (appTheme.darkTheme) ? colorSheme : Colors.orange,
      colorSecundario: Colors.grey,
      slides: [
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
        SvgPicture.asset('assets/svgs/slide-5.svg'),
      ],
    );
  }
}

//Color(0xffFF5A7E)