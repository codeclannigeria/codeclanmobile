import 'package:codeclanmobile/common/custom_button.dart';
import 'package:codeclanmobile/common/custom_text_form_field.dart';
import 'package:codeclanmobile/main.dart';
import 'package:codeclanmobile/screens/tasks/task_success_view.dart';
import 'package:codeclanmobile/services/api/models/task_dto.dart';
import 'package:codeclanmobile/utils/spaces.dart';
import 'package:codeclanmobile/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:simple_html_css/simple_html_css.dart';
import 'package:url_launcher/url_launcher.dart';

class SubmitTaskView extends StatelessWidget {
  final Item task;

  const SubmitTaskView({Key key, @required this.task}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var widthOfScreen = MediaQuery.of(context).size.width;
    var heightOfScreen = MediaQuery.of(context).size.height;
    var unescape = new HtmlUnescape();
    return Scaffold(
        // backgroundColor: Color(0XFFf4f5f9),
        // appBar: AppBar(
        //     backgroundColor: Color(0XFFf4f5f9),
        //     elevation: 0,
        //     leading: InkWell(
        //       onTap: () => Navigator.of(context).pop(),
        //       child: Icon(
        //         FlutterIcons.arrow_left_sli,
        //         color: Colors.black,
        //       ),
        //     )),
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
                Color(0xFF3E3F62),
                Color(0xFF343555),
                Color(0xFFAE74EC)
              ])),
        ),
        Image.asset('assets/images/eclipse.png'),
        SafeArea(
          child: Container(
              padding: EdgeInsets.only(top: 20),
              height: heightOfScreen,
              width: widthOfScreen,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: ListView(
                  children: <Widget>[
                    Row(
                      children: [
                        InkWell(
                          onTap: () => Navigator.of(context).pop(),
                          child: Icon(
                            FlutterIcons.arrow_left_sli,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SpaceH12(),
                    Text(
                      'Submit Task',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                    ),
                    SpaceH20(),
                    // HtmlWidget(
                    //   '${unescape.convert(task.description)}...',
                    //   onTapUrl: (url) => print('tapped $url'),
                    //   customStylesBuilder: (element) {
                    //     if (element.localName == 'h1') {
                    //       return {'color': 'red'};
                    //     }
                    //     return null;
                    //   },
                    //   textStyle: GoogleFonts.poppins(
                    //       textStyle: TextStyle(
                    //           color: AppColors.white,
                    //           fontWeight: FontWeight.w300,
                    //           fontSize: 12)),
                    // ),
                    Builder(
                      builder: (BuildContext context) {
                        return RichText(
                          text: HTML.toTextSpan(
                              context, '${unescape.convert(task.description)}',
                              defaultTextStyle: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 13)), linksCallback: (link) {
                            // You can now use the url_launcher library to open the link.
                            // Or you can handle the link in your app itself. This gives you
                            // complete control over your links.
                            // For now, let's just print it
                            _launchUniversalLinkIos(link);
                            print(link);
                          }),
                        );
                      },
                    ),
                    SpaceH30(),
                    CustomTextFormField(
                      hasPrefixIcon: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: new BorderSide(
                            color: AppColors.blackShade1.withOpacity(0.2)),
                        borderRadius: new BorderRadius.circular(5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: new BorderSide(
                            color: AppColors.blackShade1.withOpacity(0.1)),
                        borderRadius: new BorderRadius.circular(5),
                      ),
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 8.0, top: 8.0),
                      textInputType: TextInputType.text,
                      titleStyle: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: AppColors.primaryColor, fontSize: 15)),
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
                              color: AppColors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 10)),
                    ),
                    SpaceH30(),
                    CustomTextFormField(
                      hasPrefixIcon: true,
                      maxlines: 10,
                      focusedBorder: OutlineInputBorder(
                        borderSide: new BorderSide(
                            color: AppColors.blackShade1.withOpacity(0.2)),
                        borderRadius: new BorderRadius.circular(5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: new BorderSide(
                            color: AppColors.blackShade1.withOpacity(0.1)),
                        borderRadius: new BorderRadius.circular(5),
                      ),
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 8.0, top: 8.0),
                      textInputType: TextInputType.multiline,
                      titleStyle: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: AppColors.primaryColor, fontSize: 15)),
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
                      color: AppColors.primaryColor,
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SuccessTaskView()),
                      ),
                      textStyle: GoogleFonts.poppins(
                          textStyle: TextStyle(color: Colors.white)),
                    ),
                    SpaceH30(),
                  ],
                ),
              )),
        ),
      ],
    ));
  }

  Future<void> _launchUniversalLinkIos(String url) async {
    if (await canLaunch(url)) {
      final bool nativeAppLaunchSucceeded = await launch(
        url,
        forceSafariVC: false,
        universalLinksOnly: true,
      );
      if (!nativeAppLaunchSucceeded) {
        await launch(
          url,
          forceSafariVC: true,
        );
      }
    }
  }
}
