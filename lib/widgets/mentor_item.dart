import 'package:codeclanmobile/blocs/track_bloc.dart';
import 'package:codeclanmobile/screens/tracks/track_enroll_success.dart';
import 'package:codeclanmobile/services/api/models/mentor_input.dart';
import 'package:codeclanmobile/services/api/models/track_mentors_dto.dart';
import 'package:codeclanmobile/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class MentorItem extends StatelessWidget {
  final Item mentor;
  final String trackId;

  const MentorItem({Key key, @required this.mentor, @required this.trackId})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        MentorInput mentorInput = new MentorInput();
        mentorInput.mentorId = mentor.id;
        BlocProvider.of<TracksBloc>(context)
            .add(EnrollToTrack(mentorInput: mentorInput, trackId: trackId));
        // return Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => TrackEnrollSuccessView()),
        // );
      },
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20),
        //margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          //color: TopRateColors.kSecondaryLightColor,
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [AppColors.white, AppColors.white],
            begin: Alignment.center,
            end: new Alignment(-1.0, -1.0),
          ),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: AppColors.buttonShade1,
                        child: Text('${mentor.firstName[0]}',
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: AppColors.blackShade1,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 25))),
                      ),
                      SizedBox(width: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('${mentor.firstName} ${mentor.lastName}',
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: AppColors.alternateShade3,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16))),
                          SizedBox(height: 5),
                          Text('${mentor.technologies[0]}',
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: AppColors.alternateShade4,
                                      fontWeight: FontWeight.w200,
                                      fontSize: 13))),
                          SizedBox(height: 5),
                          Text('${mentor.description}',
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: AppColors.backgroundShade3,
                                      fontWeight: FontWeight.w200,
                                      fontSize: 10)))
                        ],
                      )
                    ]),
              )
            ]),
      ),
    );
  }
}
