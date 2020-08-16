import 'package:codeclanmobile/screens/courses/courses_view.dart';
import 'package:codeclanmobile/screens/dashboard/dashboard_view.dart';
import 'package:codeclanmobile/screens/tasks/task_view.dart';
import 'package:codeclanmobile/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    DashboardView(),
    TaskView(),
    CoursesView(),
    Container()
  ];

  void _onBottomNavBarTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 12,
          unselectedFontSize: 12,
          backgroundColor: Color(0xFF3E3F62),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xFFFF7698),
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
                color: Color(0xFFFE1952),
                fontWeight: FontWeight.w500),
          )),
          currentIndex: _currentIndex,
          onTap: _onBottomNavBarTab,
          items: [
            BottomNavigationBarItem(
              activeIcon: Icon(Feather.home, color: Color(0xFFFF7698)),
              icon: Icon(Feather.home, color: Color(0xFF999999)),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Feather.file, color: Color(0xFFFF7698)),
              icon: Icon(Feather.file, color: Color(0xFF999999)),
              title: Text('Tasks'),
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Feather.airplay, color: Color(0xFFFF7698)),
              icon: Icon(Feather.airplay, color: Color(0xFF999999)),
              title: Text(
                'Courses',
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Feather.user, color: Color(0xFFFF7698)),
              icon: Icon(
                Feather.user,
                color: Color(0xFF999999),
              ),
              title: Text('Account'),
            )
          ],
        ),
        body: _children[_currentIndex]);
  }
}
