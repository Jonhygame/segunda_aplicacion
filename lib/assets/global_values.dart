import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalValues {
  static ValueNotifier<bool> flagTheme = ValueNotifier<bool>(true);

  static late SharedPreferences prefs;
  static late SharedPreferences teme;
  static late SharedPreferences session;

  static Future<void> configPrefs() async {
    prefs = await SharedPreferences.getInstance();
    teme = await SharedPreferences.getInstance();
    session = await SharedPreferences.getInstance();
  }
}
