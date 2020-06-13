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

class ForgetpasswordScreen extends StatelessWidget {
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
                  height: 70,
                ),
                Container(
                  height: 200,

                  child: Center(child: Lottie.asset('assets/interactions/login_interaction.json'))),
                        SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text('Forgot Password?',
                      style: GoogleFonts.poppins(
                          color: AppColors.buttonShade1,
                          fontSize: 27,
                          fontWeight: FontWeight.w500)),
                ),
                SizedBox (height: 20,),
                Center(
                  child: Text('Enter the email associated with your account.',
                      style: GoogleFonts.poppins(
                          color: Colors.black87,
                          fontSize: 15,
                          fontWeight: FontWeight.w300)),
                ),

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
                 SizedBox(height: 30.0,),  
                SpaceH16(),
                CustomButton(
                  title: RichText(
                      text: TextSpan(text: 'Reset Password ',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500))
                  )),
                  borderRadius: 3,
                  color: Colors.black87,
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardScreen()),
                  ),
                  // textStyle: GoogleFonts.poppins(
                  //     textStyle: TextStyle(color: Colors.white)),
                ),
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}
