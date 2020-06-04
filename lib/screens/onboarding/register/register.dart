import 'package:codeclanmobile/common/custom_button.dart';
import 'package:codeclanmobile/common/custom_text_form_field.dart';
import 'package:codeclanmobile/utils/spaces.dart';
import 'package:codeclanmobile/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Icon(
            Feather.chevron_left,
            color: Colors.black,
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text('Register.',
                style: GoogleFonts.poppins(
                    color: Colors.black87,
                    fontSize: 25,
                    fontWeight: FontWeight.w500)),
            Text('Create a Code Clan account.',
                style: GoogleFonts.poppins(
                    color: Colors.black87,
                    fontSize: 13,
                    fontWeight: FontWeight.w300)),
            SizedBox(
              height: 30,
            ),
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
                  textStyle: TextStyle(color: Color(0xFF666666), fontSize: 12)),
              hasTitle: true,
              hintTextStyle: GoogleFonts.poppins(
                  textStyle: TextStyle(color: Color(0xFF666666), fontSize: 12)),
              //textStyle: Styles.customTextStyle(color: AppColors.white),
              hintText: 'First Name',
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
                  textStyle: TextStyle(color: Color(0xFF666666), fontSize: 12)),
              hasTitle: true,
              hintTextStyle: GoogleFonts.poppins(
                  textStyle: TextStyle(color: Color(0xFF666666), fontSize: 12)),
              //textStyle: Styles.customTextStyle(color: AppColors.white),
              hintText: 'Last Name',
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
                  textStyle: TextStyle(color: Color(0xFF666666), fontSize: 12)),
              hasTitle: true,
              hintTextStyle: GoogleFonts.poppins(
                  textStyle: TextStyle(color: Color(0xFF666666), fontSize: 12)),
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
                  textStyle: TextStyle(color: Color(0xFF666666), fontSize: 12)),
              hasTitle: true,
              hintTextStyle: GoogleFonts.poppins(
                  textStyle: TextStyle(color: Color(0xFF666666), fontSize: 12)),
              //textStyle: Styles.customTextStyle(color: AppColors.white),
              hintText: 'Password',
              obscured: true,
              title: '',
            ),
            SizedBox(height: 70),
            CustomButton(
              title: RichText(
                  text: TextSpan(text: 'Create ', children: <TextSpan>[
                TextSpan(
                    text: 'Account',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)))
              ])),
              borderRadius: 3,
              color: AppColors.buttonShade1,
              onPressed: () => {},
              textStyle: GoogleFonts.poppins(
                  textStyle: TextStyle(color: Colors.white)),
            ),
            SpaceH16(),
            Center(
          child: RichText(
            text: TextSpan(
                text: 'Already created an account? ',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Color(0xFF666666), fontWeight: FontWeight.w400, fontSize: 12)),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Sign in',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Color(0xFFCE74AB),
                              fontSize: 12,
                              fontWeight: FontWeight.bold)))
                ]),
          ),
        ),
          ],
        ),
      ),
    );
  }
}
