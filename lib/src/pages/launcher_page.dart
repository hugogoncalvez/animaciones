import 'package:flutter/material.dart';
import 'package:animaciones/src/theme/theme_changer.dart';
import 'package:animaciones/src/routes/routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LauncherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Diseños en Flutter - Teléfono'),
        centerTitle: true,
        backgroundColor: appTheme.colorScheme.secondary,
      ),
      drawer: _MenuPrincipal(),
      body: _ListaOpciones(),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, i) => ListTile(
              title: Text(pageRoutes[i].titulo),
              leading: FaIcon(pageRoutes[i].icon,
                  color: appTheme.colorScheme.secondary),
              trailing: Icon(Icons.chevron_right,
                  color: appTheme.colorScheme.secondary),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext contex) => pageRoutes[i].page));
              },
            ),
        separatorBuilder: (context, i) =>
            Divider(color: appTheme.primaryColorLight),
        itemCount: pageRoutes.length);
  }
}

class _MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final colorSheme = appTheme.currentTheme.colorScheme.secondary;
    final Size size = MediaQuery.of(context).size;
    return Drawer(
      child: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                child: CircleAvatar(
                  backgroundColor: colorSheme,
                  minRadius: size.height * 0.09,
                  child: Text(
                    'HG',
                    style: TextStyle(fontSize: size.height * 0.05),
                  ),
                ),
              ),
              Expanded(child: _ListaOpciones()),
              ListTile(
                leading: Icon(Icons.lightbulb_outline, color: colorSheme),
                title: Text('Dark Mode'),
                trailing: Switch.adaptive(
                    value: appTheme.darkTheme,
                    onChanged: (value) => appTheme.darkTheme = value,
                    activeColor: colorSheme),
              ),
              SafeArea(
                bottom: true,
                top: false,
                right: false,
                left: false,
                child: ListTile(
                  leading: Icon(Icons.add_to_home_screen, color: colorSheme),
                  title: Text('Custom Theme'),
                  trailing: Switch.adaptive(
                      value: appTheme.customTheme,
                      onChanged: (value) => appTheme.customTheme = value,
                      activeColor: colorSheme),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
