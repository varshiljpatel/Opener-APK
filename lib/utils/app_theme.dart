import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wsn/utils/constants.dart';

ThemeData appTheme = ThemeData(
  textSelectionTheme: TextSelectionThemeData(
    selectionColor: appBrand2,
    selectionHandleColor: appBrand2,
    cursorColor: appBrand
    ),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: dark100
      ),
      backgroundColor: appBrand,
    ),
    scaffoldBackgroundColor: light100,
    primaryColor: appBrand,
    primaryTextTheme: TextTheme(
      displaySmall: TextStyle(
          color: dark100,
          fontWeight: FontWeight.normal,
          fontSize: textM
      ),
      displayMedium: TextStyle(
          color: dark100,
          fontWeight: FontWeight.normal,
          fontSize: textXL
      ),
    ),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: appBrand2),
  textTheme: TextTheme(
    labelLarge: TextStyle(backgroundColor: appBrand2)
  )
);