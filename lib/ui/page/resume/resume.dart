//import 'dart:async';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
//import 'package:portfolioavi/mobx/central_state.dart';
import 'education_page.dart';
import 'experience_page.dart';
import 'skills_page.dart';

class Resume extends StatefulWidget {
  @override
  _ResumeState createState() => _ResumeState();
}

class _ResumeState extends State<Resume> {
  int _page = 1;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff60c9df),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 1,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.computer, size: 40),
            Icon(Icons.account_balance, size: 40),
            Icon(Icons.work, size: 40),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Color(0xff60c9df),
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 500),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[chooseWidget(_page)],
        ));
  }

  // ignore: missing_return
  Widget chooseWidget(int i) {
    switch (i) {
      case 0:
        return Skills();
        break;
      case 1:
        return Education();
        break;
      case 2:
        return Experience();
        break;
    }
  }
}
