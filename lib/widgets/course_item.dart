import 'package:codeclanmobile/utils/spaces.dart';
import 'package:codeclanmobile/values/values.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var widthOfScreen = MediaQuery.of(context).size.width;
    var heightOfScreen = MediaQuery.of(context).size.height;
    return Container(
      height: heightOfScreen,
      width: widthOfScreen,
      // decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(12),
      //     gradient: LinearGradient(
      //         end: Alignment.bottomCenter,
      //         begin: Alignment.topCenter,
      //         colors: [Color(0xFF12CDFE), Color(0xFF0178D4)])),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 10,
            child: Container(
              //width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter,
                      colors: [Color(0xFF12CDFE), Color(0xFF0178D4)])),
              child: Center(
                child: Text('P',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 60))),
              ),
            ),
          ),
          Spacer(),
          Expanded(
            flex: 4,
            child: Text('Photoshop Basics  for Dummies',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 12))),
          ),
        ],
      ),
    );
  }
}
