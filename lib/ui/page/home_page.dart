import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:portfolioavi/ui/widget/bottom_page_text.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff4B4E6D),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Column(
              children: <Widget>[
                Image.asset(
                  "assets/animations/Office.gif",
                  fit: BoxFit.fill,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(bottom: 150),
              width: MediaQuery.of(context).size.width - 50,
              child: TyperAnimatedTextKit(
                  isRepeatingAnimation: false,
                  onTap: () {
                    print("Tap Event");
                  },
                  text: [
                    "To excel as a professional in dynamic and work driven environment and applying my potentials and credentials to the optimum level for the fulfillment of organizational goals.",
                  ],
                  textStyle: TextStyle(
                      fontSize: 22.0,
                      color: Colors.white70,
                      fontFamily: "BalooBhai"),
                  textAlign: TextAlign.center,
                  alignment:
                      AlignmentDirectional.topStart // or Alignment.topLeft
                  ),
            ),
            BottomPageText("Profile"),
          ],
        ),
      ),
    );
  }
}
