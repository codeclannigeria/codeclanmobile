import 'package:flutter/material.dart';

import '../../values/values.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var widthOfScreen = MediaQuery.of(context).size.width;
    var heightOfScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0XFFf4f5f9),
      body: Stack(
        children: <Widget>[
          Container(
            height: heightOfScreen,
            width: widthOfScreen,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter,
                    stops: [
                  0,
                  0.7,
                  1.0
                ],
                    colors: [
                  AppColors.backgroundShade1,
                  AppColors.backgroundShade2,
                  AppColors.backgroundShade3,
                ])),
          ),
          Image.asset('assets/images/eclipse.png'),
          SafeArea(
              child: Container(
                  height: heightOfScreen,
                  width: widthOfScreen,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      Container(
                        height: 30,
                        width: widthOfScreen,
                      ),
                    ),
                  )))
        ],
      ),
    );
  }
}
