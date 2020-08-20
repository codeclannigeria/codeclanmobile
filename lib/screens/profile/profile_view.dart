import 'package:codeclanmobile/values/values.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/custom_button.dart';
import '../../utils/spaces.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var widthOfScreen = MediaQuery.of(context).size.width;
    var heightOfScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0XFFf4f5f9),
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
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                  height: heightOfScreen,
                  width: widthOfScreen,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Container(
                        height: 200,
                        width: widthOfScreen,
                        decoration: BoxDecoration(
                            color: AppColors.alternateShade2,
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.elliptical(
                                  MediaQuery.of(context).size.width, 200.0),
                            )),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 15.0),
                            child: Text(
                              'Profile',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 30),
                              ),
                            ),
                          ),
                          SpaceH40(),
                          Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            height: MediaQuery.of(context).size.width / 2.5,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.white,
                              image: DecorationImage(
                                  image: AssetImage("assets/images/user.png"),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          SpaceH20(),
                          Container(
                            padding: EdgeInsets.all(30),
                            width: widthOfScreen,
                            height: 370,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Column(
                              children: <Widget>[
                                SpaceH20(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Isaiah',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                    ),
                                    Text(
                                      'First name',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: AppColors.blackShade1
                                                .withOpacity(0.7),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                                SpaceH8(),
                                Divider(
                                  color: AppColors.alternateShade2,
                                ),
                                SpaceH8(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Adeleke',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                    ),
                                    Text(
                                      'Last name',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: AppColors.blackShade1
                                                .withOpacity(0.7),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                                SpaceH8(),
                                Divider(
                                  color: AppColors.alternateShade2,
                                ),
                                SpaceH8(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'codeclannigeria@gmail.com',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                    ),
                                    Text(
                                      'Email',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: AppColors.blackShade1
                                                .withOpacity(0.7),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                                SpaceH8(),
                                Divider(
                                  color: AppColors.alternateShade2,
                                ),
                                SpaceH8(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      '*************',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                    ),
                                    Text(
                                      'Password',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: AppColors.blackShade1
                                                .withOpacity(0.7),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SpaceH20(),
                          CustomButton(
                            title: Text(
                              'Edit Profile',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15)),
                            ),
                            borderRadius: 3,
                            color: AppColors.buttonShade1.withOpacity(0.9),
                            onPressed: () {},
                          ),
                        ],
                      )
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
