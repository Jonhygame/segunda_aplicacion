/*import 'package:flutter/material.dart';
import 'package:segunda_aplicacion/assets/global_values.dart';
import 'package:segunda_aplicacion/assets/styles_app.dart';
import 'package:segunda_aplicacion/screens/login_screen.dart';
import 'package:segunda_aplicacion/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

bool? check = GlobalValues.check.value;
SharedPreferences? _prefs;

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    cargarPreferencias();
    super.initState();
  }

  cargarPreferencias() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      check = _prefs!.getBool('check');
      GlobalValues.check.value = check!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: GlobalValues.flagTheme,
        builder: (context, value, _) {
          return MaterialApp(
              home: const LoginScreen(),
              routes: getRoutes(),
              //theme: ThemeData.dark(),
              //theme: StylesApp.darkTheme(context));
              theme: value
                  ? StylesApp.darkTheme(context)
                  : StylesApp.lightTheme(context));
        });
  }
}*/

import 'package:flutter/material.dart';
import 'package:segunda_aplicacion/assets/global_values.dart';
import 'package:segunda_aplicacion/assets/styles_app.dart';
import 'package:segunda_aplicacion/routes.dart';
import 'package:segunda_aplicacion/screens/dashboard_screen.dart';
import 'package:segunda_aplicacion/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalValues.configPrefs();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalValues.flagTheme.value = GlobalValues.teme.getBool('teme') ?? false;
    return ValueListenableBuilder(
        valueListenable: GlobalValues.flagTheme,
        builder: (context, value, _) {
          return MaterialApp(
              home: GlobalValues.session.getBool('session') ?? false
                  ? const DashboardScreen()
                  : const LoginScreen(),
              routes: getRoutes(),
              //theme: ThemeData.dark(),
              theme: value
                  ? StylesApp.darkTheme(context)
                  : StylesApp.lightTheme(context));
        });
  }
}
