import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;
  late ThemeData _currentTheme;

  ThemeChanger(int theme) {
    switch (theme) {
      case 1: //light
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light()
            .copyWith(colorScheme: ColorScheme.dark(secondary: Colors.pink));
        break;
      case 2: //dark
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark()
            .copyWith(colorScheme: ColorScheme.light(secondary: Colors.pink));
        break;
      case 3: //dark
        _darkTheme = false;
        _customTheme = true;
        break;
      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
    }
  }

  bool get darkTheme => _darkTheme;
  bool get customTheme => _customTheme;
  ThemeData get currentTheme => _currentTheme;

  set darkTheme(bool value) {
    _customTheme = false;
    _darkTheme = value;

    if (value) {
      _currentTheme = ThemeData.dark()
          .copyWith(colorScheme: ColorScheme.light(secondary: Colors.pink));
    } else {
      _currentTheme = ThemeData.light()
          .copyWith(colorScheme: ColorScheme.dark(primary: Colors.pink));
    }
    notifyListeners();
  }

  set customTheme(bool value) {
    _darkTheme = false;
    _customTheme = value;
    if (value) {
      _currentTheme = ThemeData.dark().copyWith(
          colorScheme: ColorScheme.dark(primary: Color(0xff48a0eb)),
          primaryColorLight: Colors.white,
          scaffoldBackgroundColor: Color(0xff16202b),
          textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)));
    } else {
      _currentTheme = ThemeData.dark()
          .copyWith(colorScheme: ColorScheme.light(secondary: Colors.pink));
    }
    notifyListeners();
  }
}
