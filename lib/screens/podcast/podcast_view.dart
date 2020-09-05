import 'package:codeclanmobile/utils/spaces.dart';
import 'package:codeclanmobile/values/values.dart';
import 'package:codeclanmobile/widgets/course_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PodcastView extends StatefulWidget {
  @override
  _PodcastViewState createState() => _PodcastViewState();
}

class _PodcastViewState extends State<PodcastView> {
  @override
  Widget build(BuildContext context) {
    var widthOfScreen = MediaQuery.of(context).size.width;
    var heightOfScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: heightOfScreen,
        width: widthOfScreen,
        child: Stack(
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
              height: heightOfScreen,
              width: widthOfScreen,
              child: SafeArea(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                            text: 'Listen to our ',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w200,
                                    fontSize: 18)),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Podcast',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)))
                            ]),
                      ),
                      SpaceH30(),
                      Expanded(
                        child: GridView.builder(
                            itemCount: 4,
                            shrinkWrap: true,
                            primary: false,
                            gridDelegate:
                                new SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 20.0,
                                    crossAxisSpacing: 20.0,
                                    crossAxisCount: 2),
                            itemBuilder: (_, int index) {
                              return CourseItem();
                            }),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
