import 'package:flutter/material.dart';
import 'package:wsn/screens/main_screen.dart';
import 'package:wsn/screens/splash_screen.dart';
import 'package:wsn/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Without saving number!",
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const MainScreen(),
    );
  }
}
