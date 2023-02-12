import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData lightTheme(context){
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.deepGreen,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green).copyWith(secondary: Colors.green[300])
    );
  }
  static ThemeData darkTheme(context){
    return ThemeData(
      backgroundColor: Colors.black,
      scaffoldBackgroundColor: Colors.black,
      primaryColor: AppColors.lightGreen,
      brightness: Brightness.dark
    );
  }
}

class AppColors {
  static Color deepGreen = Color(0xff1f8774);
  static Color lightGreen = Color(0xff34f4c8);
  static Color deepBlue = Color(0xff2d4f88);
  static Color mediumBlue = Color(0xff2288f7);
  static Color deepViolet = Color(0xff642c84);
  static Color lightViolet = Color(0xffbf2eff);
  static Color lightskinYellow = Color(0xfffffbe4);
  static Color deepskinYellow = Color(0xfffceac8);
}