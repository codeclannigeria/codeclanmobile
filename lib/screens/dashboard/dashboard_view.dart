import 'package:codeclanmobile/common/custom_button.dart';
import 'package:codeclanmobile/screens/onboarding/register/register.dart';
import 'package:codeclanmobile/utils/spaces.dart';
import 'package:codeclanmobile/values/values.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFf4f5f9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                      text: 'Hi ',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Color(0xFF666666),
                              fontWeight: FontWeight.w400,
                              fontSize: 20)),
                      children: <TextSpan>[
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterScreen()),
                                );
                              },
                            text: 'Fortune',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: AppColors.buttonShade1,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)))
                      ]),
                ),
                SpaceH40(),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: menuCard(
                            Color(0xFFfeebe8),
                            Color(0xFFea634f),
                            Feather.user,
                            'Assigned\nmentor',
                            'Get hands on coding help',
                            '1')),
                    SpaceW16(),
                    Expanded(
                        child: menuCard(
                            Color(0xFFe3eefe),
                            Color(0xFF5685c8),
                            Feather.file,
                            'Pending\ntasks',
                            'Move to the next stage',
                            '2'))
                  ],
                ),
                SpaceH20(),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: menuCard(
                          Color(0xFFece5ff),
                          Color(0xFF6233a9),
                          Feather.trending_up,
                          'Current\nstage',
                          'See your progress',
                          null),
                    ),
                    SpaceW16(),
                    Expanded(
                        child: menuCard(
                            Color(0xFFe2fff0),
                            Color(0xFF67c38f),
                            Feather.award,
                            'My\ntracks',
                            'Your enrolled tracks',
                            '1'))
                  ],
                ),
                SpaceH40(),
                Center(child: Icon(SimpleLineIcons.exclamation, size: 35, color: AppColors.blackShade1.withOpacity(0.5))),
                SpaceH16(),
                Center(
                  child: Text('Need to enroll to a track?',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Color(0xFF666666),
                              fontWeight: FontWeight.w400,
                              fontSize: 12))),
                ),
                SpaceH16(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: CustomButton(
                    title: RichText(
                        text: TextSpan(text: 'Enroll ', children: <TextSpan>[
                      TextSpan(
                          text: 'Now',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)))
                    ])),
                    borderRadius: 3,
                    color: AppColors.blackShade1.withOpacity(0.5),
                    onPressed: () => {},
                    textStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget menuCard(
    Color color, Color iconColor, icon, title, description, String count) {
  return Container(
    height: 200,
    color: color,
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SpaceH12(),
          Row(
            children: <Widget>[
              Icon(
                icon,
                color: iconColor,
              ),
              SpaceW8(),
              count == null
                  ? Container()
                  : CircleAvatar(
                      child: Text(count,
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10))),
                      radius: 10,
                      backgroundColor: Color(0xFFFF8875))
            ],
          ),
          SpaceH24(),
          Text(title,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Color(0xFF666666),
                      fontWeight: FontWeight.w500,
                      fontSize: 15))),
          SpaceH8(),
          Text(description,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Color(0xFF666666),
                      fontWeight: FontWeight.w400,
                      fontSize: 10))),
        ],
      ),
    ),
  );
}
