import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wsn/screens/main_screen.dart';
import 'package:wsn/utils/colors_const.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MainScreen.route());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Stack(
            children: [
              Center(
                child: SvgPicture.asset("assets/ic_logo.svg", width: MediaQuery.of(context).size.width / 2.5, colorFilter: ColorFilter.mode(appBrand, BlendMode.srcIn)),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SvgPicture.asset("assets/OpenEr.svg", width: 125,)
              ),
            ],
          ),
        ),
      ),
    );
  }
}