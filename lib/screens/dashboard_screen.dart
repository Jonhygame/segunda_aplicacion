import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:segunda_aplicacion/assets/global_values.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bienvenidos :D')),
      drawer: createDrawer(context),
    );
  }

  Widget createDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://e0.pxfuel.com/wallpapers/911/260/desktop-wallpaper-minecraft-game-poster-logo.jpg'),
              ),
              accountName: Text('Nombre'),
              accountEmail: Text('correo')),
          ListTile(
            leading: Image.asset('assets/images/landing-page.png'),
            trailing: const Icon(Icons.chevron_right),
            title: const Text('Practica 1'),
            subtitle: const Text('Deslizar y animar'),
            onTap: () {
              Navigator.pushNamed(context, '/item');
            },
          ),
          ListTile(
            leading: Image.asset('assets/images/landing-page.png'),
            trailing: const Icon(Icons.chevron_left),
            title: const Text('Practica 2'),
            subtitle: const Text('Carrusel'),
            onTap: () {
              Navigator.pushNamed(context, '/practic2');
            },
          ),
          ListTile(
            leading: Icon(Icons.task),
            trailing: const Icon(Icons.task),
            title: const Text('Tareas'),
            subtitle: const Text('No se :v'),
            onTap: () {
              Navigator.pushNamed(context, '/task');
            },
          ),
          ListTile(
            leading: Icon(Icons.add_task),
            trailing: const Icon(Icons.task),
            title: const Text('Tareas'),
            subtitle: const Text('No se :v'),
            onTap: () {
              Navigator.pushNamed(context, '/addtask');
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            trailing: const Icon(Icons.task),
            title: const Text('logout'),
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: DayNightSwitcher(
              isDarkModeEnabled: GlobalValues.flagTheme.value,
              onStateChanged: (isDarkModeEnabled) {
                GlobalValues.teme.setBool('teme', isDarkModeEnabled);
                GlobalValues.flagTheme.value = isDarkModeEnabled;
              },
            ),
          ),
        ],
      ),
    );
  }
}
