
import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    // fontFamily: "Poppins",
    //unselectedWidgetColor: Color(0xFFD5D5D5),
    textTheme: textTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

TextTheme textTheme() {
  return TextTheme(
    //bodyText1: TextStyle(color: wTextColor),
    //bodyText2: TextStyle(color: wTextColor),
  );
}