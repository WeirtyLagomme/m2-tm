import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get darkTheme {
    //1
    return ThemeData(
      //2
      primaryColorDark: const Color(0xff1C2C48),
      backgroundColor: Colors.black,
      primaryColorLight: const Color(0xff47ABFF),
      fontFamily: 'Montserrat', //3
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          color: Colors.white,
        ),
      ),
      buttonTheme: ButtonThemeData(
        // 4
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        buttonColor: Colors.purple[50],
      ),
    );
  }
}
