import 'package:flutter/material.dart';
import 'package:animaciones/src/theme/theme_changer.dart';
import 'package:animaciones/src/widgets/headers.dart';
import 'package:provider/provider.dart';

class HeaderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return Scaffold(
        body: HeaderWaves(
      color: appTheme.colorScheme.secondary,
    ));
  }
}
