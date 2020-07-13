import 'package:codeclanmobile/common/custom_button.dart';
import 'package:codeclanmobile/utils/spaces.dart';
import 'package:codeclanmobile/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class TrackListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var widthOfScreen = MediaQuery.of(context).size.width;
    var heightOfScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0XFFf4f5f9),
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              FlutterIcons.arrow_left_sli,
              color: Colors.black,
            ),
          )),
      backgroundColor: Color(0XFFf4f5f9),
      body: Container(
        height: heightOfScreen,
        width: widthOfScreen,
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: SingleChildScrollView(
          key: PageStorageKey('tracklist-key'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Tracks',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: AppColors.blackShade1,
                        fontWeight: FontWeight.bold,
                        fontSize: 25)),
              ),
              SpaceH30(),
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 5.0, // soften the shadow
                        spreadRadius: 0.0, //extend the shadow
                        offset: Offset(
                          0.0, // Move to right 10  horizontally
                          2.0, // Move to bottom 10 Vertically
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                width: widthOfScreen,
                height: heightOfScreen * 0.20,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: Container(
                          height: heightOfScreen,
                          width: widthOfScreen,
                          //color: Colors.white,
                          child: Lottie.asset(
                              'assets/interactions/frontend-web.json'),
                        )),
                    Expanded(
                        flex: 3,
                        child: Container(
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Frontend Development',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: AppColors.blackShade1,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15)),
                              ),
                              Text(
                                'Fronted track, including CSS, HTML and JavaScript',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 10)),
                              ),
                              CustomButton(
                                height: 30,
                                title: RichText(
                                    text: TextSpan(
                                        text: 'Enroll ',
                                        children: <TextSpan>[
                                      TextSpan(
                                          text: '',
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold)))
                                    ])),
                                borderRadius: 30,
                                color: Colors.green,
                                onPressed: () {},
                                textStyle: GoogleFonts.poppins(
                                    textStyle: TextStyle(color: Colors.white)),
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
