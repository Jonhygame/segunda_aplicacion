import 'package:flutter/material.dart';
import 'package:segunda_aplicacion/assets/styles_app.dart';
import 'package:segunda_aplicacion/screens/login_screen.dart';
import 'package:segunda_aplicacion/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: const LoginScreen(),
        routes: getRoutes(),
        theme: StylesApp.darkTheme(context));
  }
}
