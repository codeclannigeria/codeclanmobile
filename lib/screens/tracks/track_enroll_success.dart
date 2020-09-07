import 'package:codeclanmobile/common/custom_button.dart';
import 'package:codeclanmobile/utils/spaces.dart';
import 'package:codeclanmobile/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class TrackEnrollSuccessView extends StatelessWidget {
  const TrackEnrollSuccessView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var widthOfScreen = MediaQuery.of(context).size.width;
    var heightOfScreen = MediaQuery.of(context).size.height;
    return Scaffold(
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
          Container(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40),
            height: heightOfScreen,
            width: widthOfScreen,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // SvgPicture.asset(
                //   "assets/images/high_five.svg",
                //   width: 300,
                //   height: 300,
                // ),
                SpaceH30(),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: 'Track enrollment complete! ',
                        children: <TextSpan>[
                          TextSpan(
                              text: '\nYou have been assigned a mentor',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)))
                        ])),
                Padding(
                  padding: const EdgeInsets.all(60.0),
                  child: CustomButton(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Feather.arrow_left,
                          color: AppColors.buttonShade1,
                        ),
                        SpaceW12(),
                        RichText(
                            text: TextSpan(
                                text: 'Go ',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                  color: AppColors.buttonShade1,
                                )),
                                children: <TextSpan>[
                              TextSpan(
                                  text: 'Back',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: AppColors.buttonShade1,
                                          fontWeight: FontWeight.bold)))
                            ])),
                      ],
                    ),
                    borderRadius: 3,
                    color: Colors.white,
                    onPressed: () => Navigator.of(context)
                        .popUntil((route) => route.isFirst),
                    textStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(color: AppColors.buttonShade1)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
