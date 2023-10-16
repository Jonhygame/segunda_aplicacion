import 'package:flutter/material.dart';
import 'package:segunda_aplicacion/screens/add_carrera.dart';
import 'package:segunda_aplicacion/screens/add_professor.dart';
import 'package:segunda_aplicacion/screens/add_tarea.dart';
import 'package:segunda_aplicacion/screens/add_task.dart';
import 'package:segunda_aplicacion/screens/calendar_screen.dart';
import 'package:segunda_aplicacion/screens/carrera_screen.dart';
import 'package:segunda_aplicacion/screens/dashboard_screen.dart';
import 'package:segunda_aplicacion/screens/item_screen.dart';
import 'package:segunda_aplicacion/screens/login_screen.dart';
import 'package:segunda_aplicacion/screens/popular_screen.dart';
import 'package:segunda_aplicacion/screens/practica2_screen.dart';
import 'package:segunda_aplicacion/screens/profesor_screen.dart';
import 'package:segunda_aplicacion/screens/tarea_screen.dart';
import 'package:segunda_aplicacion/screens/task_screen.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    '/dash': (BuildContext context) => const DashboardScreen(),
    '/item': (BuildContext context) => ItemScreen(),
    '/login': (BuildContext context) => const LoginScreen(),
    '/practic2': (BuildContext context) => const practica2Screen(),
    '/task': (BuildContext context) => const TaskScreen(),
    '/addtarea': (BuildContext context) => AddTarea(),
    '/popular': (BuildContext context) => const PopularScreen(),
    '/calendar': (BuildContext context) => TableEventsExample(),
    '/professor': (BuildContext context) => const ProfeScreen(),
    '/carreras': (BuildContext context) => const CarreraScreen(),
    '/tasks': (BuildContext context) => const TareaScreen(),
    '/addTask': (BuildContext context) => AddTask(),
    '/addProfe': (BuildContext context) => AddProfe(),
    '/addCarrera': (BuildContext context) => AddCarrera(),
  };
}
