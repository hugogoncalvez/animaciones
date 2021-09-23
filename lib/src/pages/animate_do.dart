import 'package:animaciones/src/pages/navegacion_page.dart';
import 'package:animaciones/src/pages/twitter_page.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Pagina1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: FadeIn(
            delay: Duration(milliseconds: 500), child: Text('Animate_do')),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (BuildContext contex) => TwitterPage()));
              },
              icon: FaIcon(FontAwesomeIcons.twitter)),
          SlideInLeft(
            from: size.height * 0.05,
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (BuildContext contex) => Pagina1()));
                },
                icon: FaIcon(FontAwesomeIcons.angleRight)),
          )
        ],
      ),
      floatingActionButton: ElasticInRight(
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (BuildContext contex) => NavegacionPage()));
          },
          child: FaIcon(FontAwesomeIcons.play),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElasticIn(
              delay: Duration(milliseconds: 1500),
              child: Icon(Icons.new_releases,
                  color: Colors.blue, size: size.height * 0.1),
            ),
            FadeInDown(
              delay: Duration(milliseconds: 200),
              child: Text(
                'Título',
                style: TextStyle(
                    fontSize: size.height * 0.05, fontWeight: FontWeight.w300),
              ),
            ),
            FadeInDown(
              delay: Duration(milliseconds: 800),
              child: Text(
                'Soy un texto pequeño',
                style: TextStyle(fontSize: size.height * 0.02),
              ),
            ),
            FadeInLeft(
              delay: Duration(milliseconds: 100),
              child: Container(
                width: size.height * 0.3,
                height: size.height * 0.004,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
