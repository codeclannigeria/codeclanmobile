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
              panel: BlocConsumer<DashboardBloc, DashboardState>(
                listener: (context, state) {},
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
