import 'package:flutter/material.dart';
import 'package:segunda_aplicacion/screens/add_task.dart';
import 'package:segunda_aplicacion/screens/dashboard_screen.dart';
import 'package:segunda_aplicacion/screens/item_screen.dart';
import 'package:segunda_aplicacion/screens/login_screen.dart';
import 'package:segunda_aplicacion/screens/practica2_screen.dart';
import 'package:segunda_aplicacion/screens/task_screen.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    '/dash': (BuildContext context) => const DashboardScreen(),
    '/item': (BuildContext context) => ItemScreen(),
    '/login': (BuildContext context) => const LoginScreen(),
    '/practic2': (BuildContext context) => const practica2Screen(),
    '/task': (BuildContext context) => const TaskScreen(),
    '/addtask': (BuildContext context) => const AddTask(),
  };
}
