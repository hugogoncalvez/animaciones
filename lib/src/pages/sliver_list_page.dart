import 'package:animaciones/src/theme/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        _MainScroll(),
        Positioned(bottom: 0, right: 0, child: _Botton())
      ],
    ));
  }
}

class _Botton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final Size size = MediaQuery.of(context).size;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(size.width * 0.12))),
            minimumSize: Size(size.width * 0.9, size.height * 0.09),
            primary: (appTheme.darkTheme)
                ? appTheme.currentTheme.colorScheme.secondary
                : Color(0xffed6762)),
        onPressed: () {},
        child: Text('Creata New List',
            style: TextStyle(
                color: (appTheme.darkTheme) ? Colors.black : Colors.white,
                fontSize: size.height * 0.03,
                letterSpacing: size.width * 0.01)));
  }
}

class _MainScroll extends StatelessWidget {
  final items = [
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
  ];

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    final double height = MediaQuery.of(context).size.height;
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
            floating: true,
            delegate: _SliverCustomHeaderDelegate(
                minHeight: height * 0.2,
                maxHeight: height * 0.21,
                child: Container(
                  alignment: Alignment.centerLeft,
                  color: appTheme.scaffoldBackgroundColor,
                  child: _Titulo(),
                ))),
        SliverList(
            delegate: SliverChildListDelegate(([
          ...items,
          SizedBox(
            height: height * 0.1,
          )
        ])))
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate(
      {required this.minHeight, required this.maxHeight, required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => maxHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
    throw UnimplementedError();
  }
}

class _ListaTareas extends StatelessWidget {
  final items = [
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => items[index],
    );
  }
}

class _Titulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: height * 0.03, vertical: height * 0.01),
            child: Text(
              'New',
              style: TextStyle(
                  fontSize: height * 0.05,
                  fontWeight: FontWeight.bold,
                  color:
                      (appTheme.darkTheme) ? Colors.grey : Color(0xff532128)),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                SizedBox(width: height * 0.1),
                Positioned(
                  bottom: height * 0.003,
                  child: Container(
                    width: height * 0.1,
                    height: height * 0.005,
                    color:
                        (appTheme.darkTheme) ? Colors.grey : Color(0xfff7cdd5),
                  ),
                ),
                Container(
                  child: Text(
                    'List',
                    style: TextStyle(
                        color: Color(0xffd93a30),
                        fontSize: height * 0.05,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  final String titulo;
  final Color color;

  const _ListItem(this.titulo, this.color);
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(height * 0.02),
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.all(height * 0.01),
      height: height * 0.1,
      decoration: BoxDecoration(
          color: (appTheme.darkTheme) ? Colors.grey : color,
          borderRadius: BorderRadius.circular(height * 0.02)),
      child: Text(
        titulo,
        style: TextStyle(color: Colors.white, fontSize: height * 0.023),
      ),
    );
  }
}
