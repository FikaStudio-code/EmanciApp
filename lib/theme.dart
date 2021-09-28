import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: Color(0xFFCAF5F5),
      appBarTheme: appBarTheme(),
      textTheme: textTheme(),
      inputDecorationTheme: inputDecorationTheme());
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(28),
      borderSide: BorderSide(color: kTextColor),
      gapPadding: 10);

  return InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      border: outlineInputBorder);
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    centerTitle: true,
    color: Color(0xFFCAF5F5),
    elevation: 5,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Color(0xFF2C3636)),
    textTheme:
        TextTheme(headline6: TextStyle(color: Color(0xFF607575), fontSize: 18)),
  );
}
