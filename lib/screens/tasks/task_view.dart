import 'package:codeclanmobile/screens/tasks/bloc/task_bloc.dart';
import 'package:codeclanmobile/screens/tasks/submit_task_view.dart';
import 'package:codeclanmobile/services/api/models/task_dto.dart';
import 'package:codeclanmobile/utils/spaces.dart';
import 'package:codeclanmobile/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html_unescape/html_unescape.dart';

class TaskView extends StatefulWidget {
  @override
  _TaskViewState createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  @override
  Widget build(BuildContext context) {
    var widthOfScreen = MediaQuery.of(context).size.width;
    var heightOfScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0XFFf4f5f9),
      body: BlocProvider(
          create: (context) => TaskBloc()..add(GetTracks()),
          child: BlocConsumer<TaskBloc, TaskState>(
            listener: (context, state) {},
            builder: (context, state) {
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
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Tasks',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: AppColors.alternateShade3,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25)),
                          ),
                          SpaceH30(),
                          // Column(
                          //   children: <Widget>[taskItem(heightOfScreen, widthOfScreen)],
                          // ),
                          state is TaskLoading
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : state is TaskLoaded
                                  ? Expanded(
                                      child: ListView.separated(
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return taskItem(
                                                heightOfScreen,
                                                widthOfScreen,
                                                state.task.items[index],
                                                context);
                                          },
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return SpaceH16();
                                          },
                                          itemCount: 3),
                                    )
                                  : Container()
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          )),
    );
  }
}

Widget taskItem(
    heightOfScreen, widthOfScreen, Item task, BuildContext context) {
  var unescape = new HtmlUnescape();
  return Container(
    margin: const EdgeInsets.only(bottom: 6.0),
    height: heightOfScreen * 0.30,
    width: widthOfScreen,
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        blurRadius: 5.0, // soften the shadow
        spreadRadius: 0.0, //extend the shadow
        offset: Offset(
          0.0, // Move to right 10  horizontally
          2.0, // Move to bottom 10 Vertically
        ),
      )
    ], borderRadius: BorderRadius.circular(10), color: Colors.white),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '${task.title}',
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: AppColors.buttonShade1,
                    fontWeight: FontWeight.w600,
                    fontSize: 15)),
          ),
          SpaceH8(),
          Text(
            '${task.track}',
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Color(0xFFAC57B8),
                    fontWeight: FontWeight.w400,
                    fontSize: 10)),
          ),
          SpaceH8(),
          HtmlWidget(
            '${unescape.convert(task.description).substring(0, 200)}...',
            textStyle: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Color(0xFF666666),
                    fontWeight: FontWeight.w300,
                    fontSize: 12)),
          ),
          // Text(
          //   '${unescape.convert(task.description)}',
          //   textAlign: TextAlign.left,
          //   softWrap: true,
          //   maxLines: 5,
          //   overflow: TextOverflow.fade,
          //   style: GoogleFonts.poppins(
          //       textStyle: TextStyle(
          //           color: Color(0xFF666666),
          //           fontWeight: FontWeight.w300,
          //           fontSize: 12)),
          // ),
          Spacer(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Feather.clock,
                      color: Color(0xFF666666).withOpacity(0.5),
                      size: 15,
                    ),
                    SpaceW8(),
                    Text(
                      '${task.stage}',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Color(0xFF666666).withOpacity(0.5),
                              fontWeight: FontWeight.w400,
                              fontSize: 12)),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SubmitTaskView(
                              task: task,
                            )),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: AppColors.alternateShade3,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'See Details',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 14)),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
