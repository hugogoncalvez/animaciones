import 'package:animaciones/src/models/layaut_model.dart';
import 'package:animaciones/src/pages/launcher_tablet_page.dart';
import 'package:animaciones/src/theme/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:animaciones/src/pages/launcher_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(
    MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeChanger>(create: (_) => new ThemeChanger( 2 )),
      ChangeNotifierProvider<LayoutModel>(create: (_) => new LayoutModel())
    ],
    child: MyApp(),
  ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: currentTheme,
      title: 'Curso Diseño',
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          final screenSize = MediaQuery.of(context).size;
          if (screenSize.width > 500) {
            return LauncherTabletPage();
          } else {
            return LauncherPage();
          }
        },
      ),
    );
  }
}
