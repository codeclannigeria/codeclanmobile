import 'dart:math';

import 'package:codeclanmobile/common/custom_button.dart';
import 'package:codeclanmobile/screens/tracks/mentor_selection.dart';
import 'package:codeclanmobile/services/api/models/track_list_dto.dart';
import 'package:codeclanmobile/utils/spaces.dart';
import 'package:codeclanmobile/values/values.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrackItem extends StatefulWidget {
  final Items item;

  const TrackItem({Key key, this.item}) : super(key: key);

  @override
  _TrackItemState createState() => _TrackItemState();
}

class _TrackItemState extends State<TrackItem> {
  static List<Color> gradientBlue = [Color(0xFF12CDFE), Color(0xFF038BF4)];
  static List<Color> gradientRed = [Color(0xFFFF7698), Color(0xFFFE1952)];

  final gradientListColors = [gradientBlue, gradientRed];
  final _random = new Random();
  @override
  Widget build(BuildContext context) {
    var widthOfScreen = MediaQuery.of(context).size.width;
    var heightOfScreen = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MentorSelectionScreen(
                  item: widget.item,
                )),
      ),
      child: Container(
          padding: EdgeInsets.all(Sizes.PADDING_20),
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
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/track-item-mask.png')),
              gradient: LinearGradient(
                  colors: gradientListColors[
                      _random.nextInt(gradientListColors.length)])),
          width: widthOfScreen,
          height: heightOfScreen * 0.17,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                'assets/images/track-icon.png',
                width: 30,
                height: 30,
              ),
              SpaceH12(),
              Text('${widget.item.title}',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16))),
              Text('${widget.item.description}',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w200,
                          fontSize: 10)))
            ],
          )),
    );
  }
}
