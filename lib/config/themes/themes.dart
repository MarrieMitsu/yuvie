import 'package:flutter/material.dart';

enum AppTheme {
  Pure,
  Moonlight,
}

final appThemeData = {
  AppTheme.Pure: ThemeData(
    brightness: Brightness.light,
    primaryColor: Color.fromRGBO(234, 234, 234, 1),
  ),
  AppTheme.Moonlight: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color.fromRGBO(24, 35, 90, 1),
  ),
};