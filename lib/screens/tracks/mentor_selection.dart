import 'package:codeclanmobile/utils/spaces.dart';
import 'package:codeclanmobile/values/values.dart';
import 'package:codeclanmobile/widgets/mentor_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class MentorSelectionScreen extends StatefulWidget {
  @override
  _MentorSelectionScreenState createState() => _MentorSelectionScreenState();
}

class _MentorSelectionScreenState extends State<MentorSelectionScreen> {
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
          child: SingleChildScrollView(
            key: PageStorageKey('tracklist-key'),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(
                    FlutterIcons.arrow_left_sli,
                    color: Colors.white,
                  ),
                ),
                SpaceH12(),
                Text(
                  'Choose a Mentor',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 18)),
                ),
                Text(
                  'Let\'s hold you by the hand',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w200,
                          fontSize: 12)),
                ),
                SpaceH20(),
                Container(
                  height: heightOfScreen,
                  width: widthOfScreen,
                  child: ListView.separated(
                    physics: ClampingScrollPhysics(),
                    padding: EdgeInsets.only(top: 0),
                    itemBuilder: (BuildContext context, int index) {
                      return MentorItem();
                    },
                    itemCount: 12,
                    separatorBuilder: (BuildContext context, int index) {
                      return SpaceH16();
                    },
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
