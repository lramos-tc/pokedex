import 'package:flutter/material.dart';

class AppTheme {
  //color variables
  static const Color bar = Color.fromARGB(255, 255, 107, 53);
  static const Color back = Color.fromARGB(255, 218, 210, 216);
  static const Color deep = Color.fromARGB(255, 20, 54, 66);
  static const Color green = Color.fromARGB(255, 138, 203, 136);
  static const Color light = Color.fromARGB(218, 132, 220, 207);
  static const Color contrast = Colors.black;
  static const Color gray = Color.fromARGB(255, 57, 54, 54);
  static const Color box = Color.fromARGB(255, 10, 105, 195);

  static const Color electric = Color.fromRGBO(247, 208, 44, 1.000);
  static const Color normal = Color.fromRGBO(168, 167, 122, 1.000);
  static const Color fire = Color.fromRGBO(238,129,48,1.000);
  static const Color water = Color.fromRGBO(99,144,240,1.000);
  static const Color grass = Color.fromRGBO(122,199,76,1.000);
  static const Color ice = Color.fromRGBO(150,217,214,1.000);
  static const Color fighting = Color.fromRGBO(194,46,40,1.000);
  static const Color poison = Color.fromRGBO(163,62,161,1.000);
  static const Color ground = Color.fromRGBO(226,191,101,1.000);
  static const Color flying = Color.fromRGBO(169,143,243,1.000);
  static const Color psychic = Color.fromRGBO(249,85,135,1.000);
  static const Color bug = Color.fromRGBO(166,185,26,1.000);
  static const Color rock = Color.fromRGBO(182,161,54,1.000);
  static const Color ghost = Color.fromRGBO(115,87,151,1.000);
  static const Color dragon = Color.fromRGBO(111,53,252,1.000);
  static const Color dark = Color.fromRGBO(112,87,70,1.000);
  static const Color steel = Color.fromRGBO(183,183,206,1.000);
  static const Color fairy = Color.fromRGBO(214,133,173,1.000);

  //Appbar themes
  static final ThemeData lightTheme = ThemeData.light().copyWith(
      primaryColor: back,
      appBarTheme: const AppBarTheme(color: bar),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: deep,
          sizeConstraints: BoxConstraints.expand(width: 80, height: 80)),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: deep)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        backgroundColor: back,
        foregroundColor: light,
        shape: const StadiumBorder(),
      )));

  static const TextStyle menu = TextStyle(fontSize: 20, color: back);
  static const TextStyle title =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
}
