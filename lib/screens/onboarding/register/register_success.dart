import 'package:codeclanmobile/utils/spaces.dart';
import 'package:codeclanmobile/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class RegisterSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFf4f5f9),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Center(
                  child: Container(
                height: 300,
                child: Lottie.asset(
                    'assets/interactions/success_interaction.json'),
              )),
              Center(
                child: Text(
                    'Thank you for joining Code Clan Nigeria.\nWe\'ve sent you a confirmation email to the email you provided.\nPlease confirm your email to login',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: AppColors.blackShade1,
                            fontWeight: FontWeight.w400,
                            fontSize: 14))),
              ),
              SpaceH30(),
              ButtonBar(children: <Widget>[
                FlatButton(
                  child: Row(
                    children: <Widget>[
                      Icon(
                        FlutterIcons.arrow_back_mdi,
                        color: AppColors.blackShade1,
                      ),
                      Text('Back to Login',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 12))),
                    ],
                  ),
                  textColor: AppColors.buttonShade1,
                  onPressed: () => Navigator.pop(context),
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
