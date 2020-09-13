import 'package:codeclanmobile/screens/courses/courses_view.dart';
import 'package:codeclanmobile/screens/dashboard/bloc/dashboard_bloc.dart';
import 'package:codeclanmobile/screens/dashboard/dashboard_view.dart';
import 'package:codeclanmobile/screens/podcast/podcast_player_view.dart';
import 'package:codeclanmobile/screens/podcast/podcast_view.dart';
import 'package:codeclanmobile/screens/profile/profile_view.dart';
import 'package:codeclanmobile/screens/tasks/task_view.dart';
import 'package:codeclanmobile/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  PanelController _pc = new PanelController();
  int _currentIndex = 0;
  double minHeight = 0;

  final List<Widget> _children = [
    DashboardView(),
    TaskView(),
    PodcastView(),
    ProfileView(),
  ];

  void _onBottomNavBarTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardBloc(),
      child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            selectedFontSize: 12,
            unselectedFontSize: 12,
            backgroundColor: AppColors.backgroundColor,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.buttonShade1,
            unselectedItemColor: Color(0xFF999999),
            unselectedLabelStyle: GoogleFonts.poppins(
                textStyle: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF999999),
                  fontWeight: FontWeight.w500),
            )),
            selectedLabelStyle: GoogleFonts.poppins(
                textStyle: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: 12,
                  color: AppColors.buttonShade1,
                  fontWeight: FontWeight.w500),
            )),
            currentIndex: _currentIndex,
            onTap: _onBottomNavBarTab,
            items: [
              BottomNavigationBarItem(
                activeIcon: Icon(Feather.home, color: AppColors.buttonShade1),
                icon: Icon(Feather.home, color: Color(0xFF999999)),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(Feather.file, color: AppColors.buttonShade1),
                icon: Icon(Feather.file, color: Color(0xFF999999)),
                title: Text('Tasks'),
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(Feather.mic, color: AppColors.buttonShade1),
                icon: Icon(Feather.mic, color: Color(0xFF999999)),
                title: Text(
                  'Podcast',
                ),
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(Feather.user, color: AppColors.buttonShade1),
                icon: Icon(
                  Feather.user,
                  color: Color(0xFF999999),
                ),
                title: Text('Account'),
              )
            ],
          ),
          body: SlidingUpPanel(
              controller: _pc,
              minHeight: minHeight,
              maxHeight: MediaQuery.of(context).size.height,
              collapsed: Container(
                  color: AppColors.buttonShade1,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 60,
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              gradient: LinearGradient(
                                  end: Alignment.bottomCenter,
                                  begin: Alignment.topCenter,
                                  colors: [
                                    AppColors.alternateShade1,
                                    AppColors.alternateShade3
                                  ])),
                          child: Center(
                            child: Icon(Feather.headphones),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('The book of commons',
                                overflow: TextOverflow.fade,
                                maxLines: 3,
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w300))),
                            Text('Episode 2',
                                overflow: TextOverflow.fade,
                                maxLines: 3,
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w300))),
                          ],
                        ),
                        Icon(
                          Feather.play,
                          color: AppColors.white,
                        )
                      ],
                    ),
                  )),
              panel: BlocConsumer<DashboardBloc, DashboardState>(
                listener: (context, state) {
                  if (state is PodcastPlayerOpened) {
                    print("Podcast Open");
                    _pc.isPanelOpen ? _pc.show() : _pc.open();
                    return PodcastPlayerView(
                      episode: state.episode,
                      pc: _pc,
                    );
                  }
                  if (state is PodcastPlayerMinimized) {
                    setState(() {
                      minHeight = MediaQuery.of(context).size.height * 0.08;
                    });
                    _pc.close();
                  }
                },
                builder: (context, state) {
                  if (state is PodcastPlayerOpened) {
                    return PodcastPlayerView(
                      episode: state.episode,
                      pc: _pc,
                    );
                  }
                  return Container();
                },
              ),
              body: _children[_currentIndex])),
    );
  }
}
