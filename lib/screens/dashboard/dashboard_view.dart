import 'package:codeclanmobile/blocs/authentication_bloc.dart';
import 'package:codeclanmobile/common/custom_button.dart';
import 'package:codeclanmobile/screens/onboarding/register/register.dart';
import 'package:codeclanmobile/screens/tracks/track_screen.dart';
import 'package:codeclanmobile/utils/spaces.dart';
import 'package:codeclanmobile/values/values.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    var widthOfScreen = MediaQuery.of(context).size.width;
    var heightOfScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0XFFf4f5f9),
      body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (BuildContext context, AuthenticationState state) {
          if (state is AuthenticationSuccess) {
            return Stack(
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
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20)),
                              children: <TextSpan>[
                                TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //       builder: (context) => RegisterScreen()),
                                        // );
                                      },
                                    text: '${state.user.firstName}',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: AppColors.alternateShade3,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)))
                              ]),
                        ),
                        SpaceH40(),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: menuCard(
                                    Color(0xFFFF7698),
                                    Colors.black87,
                                    Feather.user,
                                    'Assigned\nmentor',
                                    'Get hands on coding help',
                                    '1',
                                    null)),
                            SpaceW16(),
                            Expanded(
                                child: menuCard(
                                    Color(0xFF038BF4),
                                    Colors.black87,
                                    Feather.file,
                                    'Pending\ntasks',
                                    'Move to the next stage',
                                    '2',
                                    null))
                          ],
                        ),
                        SpaceH20(),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: menuCard(
                                  Color(0xFF12CDFE),
                                  Colors.black87,
                                  Feather.trending_up,
                                  'Current\nstage',
                                  'See your progress',
                                  null,
                                  null),
                            ),
                            SpaceW16(),
                            Expanded(
                                child: menuCard(
                                    AppColors.alternateShade3,
                                    Colors.black87,
                                    Feather.award,
                                    'My\ntracks',
                                    'Your enrolled tracks',
                                    '${state.user.tracks.length}',
                                    () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                TrackListScreen()))))
                          ],
                        ),
                        SpaceH40(),
                        Center(
                            child: Icon(SimpleLineIcons.exclamation,
                                size: 35,
                                color: AppColors.white.withOpacity(0.5))),
                        SpaceH16(),
                        Center(
                          child: Text('Want to enroll to a track?',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12))),
                        ),
                        SpaceH16(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60.0),
                          child: CustomButton(
                            title: RichText(
                                text: TextSpan(
                                    text: 'Enroll ',
                                    children: <TextSpan>[
                                  TextSpan(
                                      text: 'Now',
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)))
                                ])),
                            borderRadius: 3,
                            color: AppColors.buttonShade1.withOpacity(0.9),
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TrackListScreen()),
                            ),
                            textStyle: GoogleFonts.poppins(
                                textStyle: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}

Widget menuCard(Color color, Color iconColor, icon, title, description,
    String count, Function ontap) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
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
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10))),
                        radius: 10,
                        backgroundColor: Colors.white)
              ],
            ),
            SpaceH24(),
            Text(title,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15))),
            SpaceH8(),
            Text(description,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 10))),
          ],
        ),
      ),
    ),
  );
}
