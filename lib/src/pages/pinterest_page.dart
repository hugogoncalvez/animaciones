import 'package:animaciones/src/theme/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:animaciones/src/widgets/pinterest_menu.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: Scaffold(
        body: Stack(
          children: [
            PinterestGrid(),
            _PinterestMenuLocation(),
          ],
        ),
        // body: PinterestMenu(),//PinterestGrid(),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool mostrar = Provider.of<_MenuModel>(context).mostrar;
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Positioned(
        bottom: 30,
        child: Container(
          width: width,
          child: Align(
            child: PinterestMenu(
              mostrar: mostrar,
              backGroundColor: appTheme.scaffoldBackgroundColor,
              inactivColor: Colors.blueGrey,
              activeColor: appTheme.colorScheme.secondary,
              items: [
                PinterestButton(
                    onPressed: () {
                      print('Icon pie cart');
                    },
                    icon: Icons.pie_chart),
                PinterestButton(
                    onPressed: () {
                      print('Icon ac unit');
                    },
                    icon: Icons.ac_unit),
                PinterestButton(
                    onPressed: () {
                      print('Icon acces alarm');
                    },
                    icon: Icons.access_alarm),
                PinterestButton(
                    onPressed: () {
                      print('Icon time');
                    },
                    icon: Icons.access_time),
                PinterestButton(
                    onPressed: () {
                      print('Icon acces');
                    },
                    icon: Icons.accessible),
              ],
            ),
          ),
        ));
  }
}

class PinterestGrid extends StatefulWidget {
  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, (index) => index);
  ScrollController controller = new ScrollController();
  double scrollAnterior = 0;

  @override
  void initState() {
    controller.addListener(() {
      if (controller.offset > scrollAnterior && controller.offset > 150) {
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
      }

      scrollAnterior = controller.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItems(
        index: index,
      ),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItems extends StatelessWidget {
  final index;

  const _PinterestItems({required this.index});

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: new Center(
          child: new CircleAvatar(
            backgroundColor: Colors.white,
            child: new Text('$index'),
          ),
        ));
  }
}

class _MenuModel with ChangeNotifier {
  bool _mostrar = true;

  bool get mostrar => _mostrar;
  set mostrar(bool mostrar) {
    _mostrar = mostrar;
    notifyListeners();
  }
}
