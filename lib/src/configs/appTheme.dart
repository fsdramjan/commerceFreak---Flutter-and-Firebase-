import 'package:flutter/material.dart';

import 'appColors.dart';

class AppTheme {
  static final appTheme = ThemeData(
    scaffoldBackgroundColor: backgroundColor,
    fontFamily: regular,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: backgroundColor,
      titleTextStyle: TextStyle(
        color: black,
        fontSize: 14,
      ),
      iconTheme: IconThemeData(
        color: black,
      ),
    ),
  );
}
