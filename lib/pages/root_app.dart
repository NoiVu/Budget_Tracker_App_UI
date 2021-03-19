import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:budget_tracker_app_ui/pages/daily_page.dart';
import 'package:budget_tracker_app_ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setSelected(4);
        },
        child: Icon(
          Icons.add,
          size: 25,
        ),
        backgroundColor: primary,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
       DailyPage(),
        Center(
          child: Text('Stats Page'),
        ),
        Center(
          child: Text('Create budget Page'),
        ),
        Center(
          child: Text('Budget Page'),
        ),
        Center(
          child: Text('Profile Page'),
        )
      ],
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      Ionicons.md_calendar,
      Ionicons.md_stats,
      Ionicons.md_wallet,
      Ionicons.md_person,
    ];
    return AnimatedBottomNavigationBar(
        icons: iconItems,
        activeIndex: pageIndex,
        gapLocation: GapLocation.center,
        activeColor: primary,
        splashColor: secondary,
        inactiveColor: black.withOpacity(0.5),
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 20,
        rightCornerRadius: 20,
        onTap: (index) {
          setSelected(index);
        });
  }

  setSelected(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
