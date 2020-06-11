import 'package:codeclanmobile/common/custom_button.dart';
import 'package:codeclanmobile/common/custom_text_form_field.dart';
import 'package:codeclanmobile/screens/tasks/task_success_view.dart';
import 'package:codeclanmobile/utils/spaces.dart';
import 'package:codeclanmobile/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class SubmitTaskView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var widthOfScreen = MediaQuery.of(context).size.width;
    var heightOfScreen = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color(0XFFf4f5f9),
        appBar: AppBar(
          backgroundColor: Color(0XFFf4f5f9),
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
                      child: Icon(
             FlutterIcons.arrow_left_sli,
              color: Colors.black,
            ),
          )),
        body: Container(
            height: heightOfScreen,
            width: widthOfScreen,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Submit Task',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: AppColors.blackShade1,
                            fontWeight: FontWeight.bold,
                            fontSize: 25)),
                  ),
                  SpaceH30(),
                  Text(
                    'Task 1',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: AppColors.buttonShade1,
                            fontWeight: FontWeight.w600,
                            fontSize: 15)),
                  ),
                  Text(
                    'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Color(0xFF666666),
                            fontWeight: FontWeight.w300,
                            fontSize: 12)),
                  ),
                  SpaceH30(),
                  CustomTextFormField(
                    hasPrefixIcon: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: new BorderSide(color: AppColors.blackShade1.withOpacity(0.2)),
                      borderRadius: new BorderRadius.circular(5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: new BorderSide(color: AppColors.blackShade1.withOpacity(0.1)),
                      borderRadius: new BorderRadius.circular(5),
                    ),
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 8.0, top: 8.0),
                    textInputType: TextInputType.text,
                    titleStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Color(0xFF666666), fontSize: 15)),
                    hasTitle: true,
                    hintTextStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Color(0xFF666666), fontSize: 12)),
                    //textStyle: Styles.customTextStyle(color: AppColors.white),
                    hintText: 'Provide the link to your task',
                    title: 'URL',
                  ),
                  SpaceH12(),
                  Text(
                    'Submission Guidelines',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            decoration: TextDecoration.underline,
                            color: AppColors.buttonShade1,
                            fontWeight: FontWeight.w500,
                            fontSize: 10)),
                  ),
                  SpaceH30(),
                  CustomTextFormField(
                    hasPrefixIcon: true,
                    maxlines: 10,
                    focusedBorder: OutlineInputBorder(
                      borderSide: new BorderSide(color: AppColors.blackShade1.withOpacity(0.2)),
                      borderRadius: new BorderRadius.circular(5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: new BorderSide(color: AppColors.blackShade1.withOpacity(0.1)),
                      borderRadius: new BorderRadius.circular(5),
                    ),
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 8.0, top: 8.0),
                    textInputType: TextInputType.multiline,
                    titleStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Color(0xFF666666), fontSize: 15)),
                    hasTitle: true,
                    hintTextStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Color(0xFF666666), fontSize: 12)),
                    //textStyle: Styles.customTextStyle(color: AppColors.white),
                    hintText: 'Include any challenges encountered',
                    title: 'Comments',
                  ),
                  SpaceH30(),
                  CustomButton(
                    title: RichText(
                        text: TextSpan(text: 'Submit ', children: <TextSpan>[
                      TextSpan(
                          text: 'Task',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)))
                    ])),
                    borderRadius: 3,
                    color: Color(0xFFAC57B8),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SuccessTaskView()),
                    ),
                    textStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            )));
  }
}
