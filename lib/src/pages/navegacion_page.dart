import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavegacionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          centerTitle: true,
          title: Text('Notification Page'),
        ),
       
        floatingActionButton: BotonFlotante(),
        bottomNavigationBar: BottomNavigation(),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int valorNotificaciones =
        Provider.of<_NotificationModel>(context).numero;
    final Size size = MediaQuery.of(context).size;
    return BottomNavigationBar(items: [
      BottomNavigationBarItem(
        label: 'Bones',
        icon: FaIcon(
          FontAwesomeIcons.bone,
        ),
      ),
      BottomNavigationBarItem(
        label: 'Notification',
        icon: Stack(
          children: [
            FaIcon(FontAwesomeIcons.bell),
            Positioned(
              top: 0,
              right: 0,           
              child: BounceInDown(
                from: 10,
                animate: (valorNotificaciones > 0) ? true : false,
                child: Bounce(
                  from: 10,
                  controller: (controller) =>
                      Provider.of<_NotificationModel>(context).bounceController = controller,
                  child: Container(
                    alignment: Alignment.center,
                    width: size.height * 0.015,
                    height: size.height * 0.015,
                    decoration: BoxDecoration(
                        //borderRadius: BorderRadius.circular(size.height * 0.05),
                        shape: BoxShape.circle,
                        color: Colors.redAccent),
                    child: Text(
                      '$valorNotificaciones',
                      style: TextStyle(
                          fontSize: size.height * 0.012, color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      BottomNavigationBarItem(
        label: 'My Dog',
        icon: FaIcon(FontAwesomeIcons.dog),
      ),
    ], selectedItemColor: Colors.pink, currentIndex: 0);
  }
}

class BotonFlotante extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        final notiModel =
            Provider.of<_NotificationModel>(context, listen: false);
        int numero = notiModel.numero;
        numero++;
        notiModel.numero = numero;
        Provider.of<_NotificationModel>(context, listen: false).numero = numero;
        if (numero > 2) {
          final controller = notiModel._bounceController;
          controller.forward(from: 0.0);
        }
      },
      child: FaIcon(FontAwesomeIcons.play),
      backgroundColor: Colors.pink,
    );
  }
}

class _NotificationModel extends ChangeNotifier {
  int _numero = 0;
  late AnimationController _bounceController;

  int get numero => _numero;

  set numero(int valor) {
    _numero = valor;
    notifyListeners();
  }

  AnimationController get bounceController => this._bounceController;

  set bounceController(AnimationController controller) {
    this._bounceController = controller;
  }
}
