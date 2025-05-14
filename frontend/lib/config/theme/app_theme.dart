import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.white,
  fontFamily: 'PlusJakartaSans',
  appBarTheme: appBarTheme,
);

AppBarTheme appBarTheme = const AppBarTheme(
  color: Colors.white,
  elevation: 0,
  centerTitle: true,
  iconTheme: IconThemeData(color: Color(0XFF8B8B8B)),
  titleTextStyle: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
);
