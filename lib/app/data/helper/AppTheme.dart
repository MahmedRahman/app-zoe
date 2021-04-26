import 'package:flutter/material.dart';

class AppTheme {
  Color colorPrimary = Color(0xFF4C1711);
  Color colorSecondary = Color(0xFFF9F9F9);
  Color colorAccent = Color(0xFF2B2B2B);

  ThemeData themeData() {
    /*
   Size size
    double fontSizeLarge = size.width * .05;
    double fontSizeMediuam = size.width * .05;
    double fontSizeSmall = size.width * .05;

    double spacingLarg = size.width * .05;
    double spacingMediuam = size.width * .05;
    double spacingSmall = size.width * .05;

    double radius = size.width * .03;
*/
    String fontFamily = 'Cairo';

    return ThemeData(
      primaryColor: colorPrimary,
      accentColor: colorAccent,
      backgroundColor: colorSecondary,
      splashColor: colorSecondary,
      fontFamily: fontFamily,
      textTheme: TextTheme(
        headline1: headline1,
        headline2: headline2,
        headline3: headline3,
        bodyText1: bodyText1,
        subtitle1: subtitle,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF4C1711),
         
        ),
      ),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        buttonColor: colorPrimary,
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }
}

const TextStyle headline1 = TextStyle(fontSize: 25, color: Color(0xFF4C1711));
const TextStyle headline2 = TextStyle(fontSize: 25);
const TextStyle headline3 = TextStyle(fontSize: 15);
const TextStyle bodyText1 = TextStyle(fontSize: 15);
const TextStyle subtitle = TextStyle(
  color: Colors.black,
  fontSize: 15,
  fontFamily: 'cairo',
);
