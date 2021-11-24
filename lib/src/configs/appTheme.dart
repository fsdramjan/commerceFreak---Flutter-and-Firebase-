import 'package:flutter/material.dart';

import 'appColors.dart';

class AppTheme {
  static final appTheme = ThemeData(
    scaffoldBackgroundColor: backgroundColor,
    fontFamily: regular,
    appBarTheme: AppBarTheme(
      elevation: 0,
      // color: black,
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
