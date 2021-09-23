import 'package:animaciones/src/Labs/slideshow_page.dart';
import 'package:flutter/material.dart';

class LayoutModel with ChangeNotifier {
  Widget _currentPage = SlideShowPage();

  set currentPage(Widget page) {
    _currentPage = page;
    notifyListeners();
  }

  Widget get currentPage => _currentPage;
}
