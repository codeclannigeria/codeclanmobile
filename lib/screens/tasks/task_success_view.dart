import 'package:codeclanmobile/screens/tasks/task_view.dart';
import 'package:codeclanmobile/utils/spaces.dart';
import 'package:codeclanmobile/values/values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SuccessTaskView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFf4f5f9),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            
            Center(
                child: Container(
                  height: 300,
                  child: Lottie.asset(
                      'assets/interactions/success_interaction.json'),
                )),
            Center(
              child: Text('Hurray!\nYou\'ve submitted the task',
              textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18))),
            ),
            SpaceH30(),
            ButtonBar(children: <Widget>[
              FlatButton(
                child: Row(
                  children: <Widget>[
                    Icon(
                      FlutterIcons.arrow_left_bold_circle_mco,
                        color: AppColors.buttonShade1,
                    ),
                    Text('Back to Tasks', style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12))),
                    
                  ],
                ),
                textColor: Color(0xFFAC57B8),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TaskView()),
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
