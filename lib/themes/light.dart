import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.grey[300],
  backgroundColor: Colors.white,
  inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(width: 0.1, color: Colors.black),
        borderRadius: BorderRadius.circular(5),
      ),
      labelStyle: TextStyle(color: Colors.black38, fontSize: 18),
      constraints: BoxConstraints(maxHeight: 60, minHeight: 40)),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
        textStyle: MaterialStateProperty.all(TextStyle(fontSize: 18)),
        fixedSize: MaterialStateProperty.all(Size(double.infinity, 40))),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
            TextStyle(fontSize: 18, fontWeight: FontWeight.w600))),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
    elevation: 1,
    selectedIconTheme: IconThemeData(
      color: Colors.blue,
      size: 24,
    ),
    unselectedIconTheme: IconThemeData(
      color: Colors.black45,
      size: 28,
    ),
    showSelectedLabels: false,
    showUnselectedLabels: false,
  ),
  appBarTheme: AppBarTheme(backgroundColor: Colors.white),
  dividerTheme: DividerThemeData(color: Colors.black26, thickness: 1),
  dividerColor: Colors.black,
);
