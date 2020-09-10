import 'dart:async';

import 'package:codeclanmobile/values/values.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../repositories/user_repository.dart';
import '../onboarding/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final UserRepository userRepository;

  _SplashScreenState({this.userRepository});

  // @override
  // void initState() {
  //   super.initState();
  //   splashTimer();
  // }

  // splashTimer() async {
  //   var duration = Duration(seconds: 3);
  //   return new Timer(duration, () {
  //     Navigator.pushReplacement(
  //         context,
  //         new MaterialPageRoute(
  //             builder: (_) => LoginScreen(userRepository: userRepository)));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundShade2,
        body: Center(
            child: Image.asset(
          'assets/images/codeclan_white.png',
          width: 100,
          height: 100,
        )));
  }
}

//
