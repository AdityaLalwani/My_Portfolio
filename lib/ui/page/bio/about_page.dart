import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolioavi/ui/widget/bottom_page_text.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.0),
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 580),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "Qualities:",
                  style: TextStyle(
                    fontSize: 26.0,
                    color: Colors.white70,
                    fontFamily: "BalooBhai",
                  ),
                ),
                SizedBox(width: 20.0, height: 100.0),
                RotateAnimatedTextKit(
                    text: ["LEADERSHIP", "OPTIMISTIC", "ADAPTABLE", "CREATIVE"],
                    textStyle: TextStyle(
                        fontSize: 30.0,
                        fontFamily: "BalooBhai",
                        color: Colors.white70),
                    textAlign: TextAlign.start,
                    alignment:
                        AlignmentDirectional.topStart // or Alignment.topLeft
                    ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 10),
            child: Text(''),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 150.0,
              ),
              Text(
                "I'm pursuing B.Tech in Information Technology from Charusat University,Gujarat.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white.withOpacity(0.87),
                    fontWeight: FontWeight.w700,
                    fontSize: 28.0),
              ),
              SizedBox(
                height: 24.0,
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  "And I love seek challenging assignments and responsibility.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.87),
                      fontWeight: FontWeight.w700,
                      fontSize: 28.0),
                ),
              ),
            ],
          ),
          BottomPageText("About"),
        ],
      ),
    );
  }
}
