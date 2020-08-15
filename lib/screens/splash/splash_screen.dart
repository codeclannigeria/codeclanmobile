import 'package:codeclanmobile/values/values.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.buttonShade1,
        body: Center(
            child: Image.asset(
          'assets/images/codeclan_white.png',
          width: 100,
          height: 100,
        )));
  }
}
