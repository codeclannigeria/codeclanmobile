import 'package:codeclanmobile/common/custom_button.dart';
import 'package:codeclanmobile/common/custom_text_form_field.dart';
import 'package:codeclanmobile/screens/dashboard/dashboard_screen.dart';
import 'package:codeclanmobile/screens/onboarding/register/register.dart';
import 'package:codeclanmobile/utils/spaces.dart';
import 'package:codeclanmobile/values/values.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //     backgroundColor: Colors.white,
      //     elevation: 0,
      //     leading: Icon(
      //       Feather.chevron_left,
      //       color: Colors.black,
      //     )),
      body: SafeArea(
        child: SingleChildScrollView(
                  child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Text('Log in.',
                    style: GoogleFonts.poppins(
                        color: AppColors.buttonShade1,
                        fontSize: 25,
                        fontWeight: FontWeight.w500)),
                Text('Sign in to your Code Clan account.',
                    style: GoogleFonts.poppins(
                        color: Colors.black87,
                        fontSize: 13,
                        fontWeight: FontWeight.w300)),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 200,

                  child: Center(child: Lottie.asset('assets/interactions/login_interaction.json'))),
                SpaceH16(),
                CustomTextFormField(
                  hasPrefixIcon: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white),
                    borderRadius: new BorderRadius.circular(5),
                  ),
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  textInputType: TextInputType.text,
                  titleStyle: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(color: Color(0xFF666666), fontSize: 12)),
                  hasTitle: true,
                  hintTextStyle: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(color: Color(0xFF666666), fontSize: 12)),
                  //textStyle: Styles.customTextStyle(color: AppColors.white),
                  hintText: 'Email Address',
                  title: '',
                ),
                SpaceH8(),
                CustomTextFormField(
                  hasPrefixIcon: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white),
                    borderRadius: new BorderRadius.circular(5),
                  ),
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  textInputType: TextInputType.text,
                  titleStyle: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(color: Color(0xFF666666), fontSize: 12)),
                  hasTitle: true,
                  hintTextStyle: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(color: Color(0xFF666666), fontSize: 12)),
                  //textStyle: Styles.customTextStyle(color: AppColors.white),
                  hintText: 'Password',
                  obscured: true,
                  title: '',
                ),
                SizedBox(height: 70),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text('Forgot password?',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 12,
                                color: AppColors.buttonShade1,
                                fontWeight: FontWeight.bold))),
                  ],
                ),
                SpaceH16(),
                CustomButton(
                  title: RichText(
                      text: TextSpan(text: 'Log me ', children: <TextSpan>[
                    TextSpan(
                        text: 'in',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)))
                  ])),
                  borderRadius: 3,
                  color: Colors.black87,
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardScreen()),
                  ),
                  textStyle: GoogleFonts.poppins(
                      textStyle: TextStyle(color: Colors.white)),
                ),
                SpaceH16(),
                Center(
                  child: RichText(
                    text: TextSpan(
                        text: 'Don\`t have an account? ',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Color(0xFF666666),
                                fontWeight: FontWeight.w400,
                                fontSize: 12)),
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
                              text: 'Register',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: AppColors.buttonShade1,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)))
                        ]),
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
