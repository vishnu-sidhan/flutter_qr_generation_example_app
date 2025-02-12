import 'package:flutter/material.dart';

final appTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(elevation: 0, color: Colors.indigo[700]),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
        backgroundColor: const WidgetStatePropertyAll(Colors.grey),
        shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)))),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
        shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)))),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.indigo[700],
    border: const OutlineInputBorder(),
  ),
  bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.black),
);
