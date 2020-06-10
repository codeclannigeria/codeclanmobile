import 'package:codeclanmobile/screens/tasks/task_view.dart';
import 'package:codeclanmobile/utils/spaces.dart';
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
              child: Text('Task Completed!',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25))),
            ),
            Center(
                child: Lottie.asset(
                    'assets/interactions/success_interaction.json')),
            SpaceH30(),
            ButtonBar(children: <Widget>[
              FlatButton(
                child: Row(
                  children: <Widget>[
                    Text('Back to Tasks'),
                    Icon(
                      FlutterIcons.arrow_right_bold_circle_mco,
                        color: Colors.black,
                    ),
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
