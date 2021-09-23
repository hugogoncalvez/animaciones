import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
 final VoidCallback onPressed;
  final IconData icon;

  PinterestButton({required this.onPressed, required this.icon});
}

class PinterestMenu extends StatelessWidget {
  final bool mostrar;
  final Color backGroundColor;
  final Color activeColor;
  final Color inactivColor;
  final List<PinterestButton> items;
  PinterestMenu(
      {required this.mostrar,
      required this.backGroundColor,
      required this.activeColor,
      required this.inactivColor,
      required this.items});

  // final List<PinterestButton> items = [
  //   PinterestButton(
  //       onPressed: () {
  //         print('Icon pie cart');
  //       },
  //       icon: Icons.pie_chart),
  //   PinterestButton(
  //       onPressed: () {
  //         print('Icon ac unit');
  //       },
  //       icon: Icons.ac_unit),
  //   PinterestButton(
  //       onPressed: () {
  //         print('Icon acces alarm');
  //       },
  //       icon: Icons.access_alarm),
  //   PinterestButton(
  //       onPressed: () {
  //         print('Icon time');
  //       },
  //       icon: Icons.access_time),
  //   PinterestButton(
  //       onPressed: () {
  //         print('Icon acces');
  //       },
  //       icon: Icons.accessible),
  // ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 250),
        opacity: (mostrar) ? 1 : 0,
        child: Builder(
          builder: (BuildContext context) {
            Provider.of<_MenuModel>(context)._backGroundColor =
                this.backGroundColor;
            Provider.of<_MenuModel>(context)._activeColor = this.activeColor;
            Provider.of<_MenuModel>(context)._inactivColor = this.inactivColor;
            return _PinterestMenuBackground(
              child: _MenuItems(items),
            );
          },
        ),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;

  const _PinterestMenuBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    Color backGroundColor = Provider.of<_MenuModel>(context)._backGroundColor;

    return Container(
      child: child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.circular(100),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5),
          ]),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;
  _MenuItems(this.menuItems);
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(menuItems.length,
            (index) => _PinterestMenuButton(index, menuItems[index])));
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  _PinterestMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final itemSeleccionado = Provider.of<_MenuModel>(context).itemSeleccionado;
    final Color activeColor = Provider.of<_MenuModel>(context)._activeColor;
    final Color inactiveColor = Provider.of<_MenuModel>(context)._inactivColor;
    return GestureDetector(
        onTap: () {
          Provider.of<_MenuModel>(context, listen: false).itemSeleccionado =
              index;
          item.onPressed();
        },
        behavior: HitTestBehavior.translucent,
        child: Container(
            child: Icon(
          item.icon,
          size: (itemSeleccionado == index) ? 35 : 25,
          color: (itemSeleccionado == index) ? activeColor : inactiveColor,
        )));
  }
}

class _MenuModel with ChangeNotifier {
  int _indexSeleccionado = 0;
  Color _backGroundColor = Colors.white;
  Color _activeColor = Colors.black;
  Color _inactivColor = Colors.blueGrey;

  int get itemSeleccionado => _indexSeleccionado;
  set itemSeleccionado(int index) {
    this._indexSeleccionado = index;
    notifyListeners();
  }

  Color get backGround => _backGroundColor;
  set backGround(Color color) {
    this._backGroundColor = color;
    notifyListeners();
  }

  Color get activeColor => _activeColor;
  set activeColor(Color color) {
    this._activeColor = color;
    notifyListeners();
  }

  Color get inactiveColor => _inactivColor;
  set inactiveColor(Color color) {
    this._inactivColor = color;
    notifyListeners();
  }
}
