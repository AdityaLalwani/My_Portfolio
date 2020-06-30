import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Education extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          child: Column(
        children: <Widget>[
          education(),
          SizedBox(
            height: 20,
          ),
          Container(
              child: institute(
                  "  Graduation: ",
                  "CHAROTAR UNIVERSITY OF SCIENCE AND TECHNOLOGY",
                  "   (2018-Present)\n Current GPA:8.82")),
          Container(
              child: institute("  Class XII:  ", "S.B.R Maheshwari Vidyapeeth",
                  "        (2017-2018)\nPercentage - 87.6%")),
        ],
      )),
    );
  }

  Widget education() {
    return Container(
        child: Text("EDUCATION",
            style: TextStyle(
              fontFamily: 'BalooBhai',
              fontSize: 50,
            )));
  }

  Widget institute(String type, String inst, String year) {
    return Container(
      margin: EdgeInsets.only(bottom: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text("$type",
                  style: TextStyle(
                    fontFamily: 'BalooBhai',
                    fontSize: 22,
                  )),
              Center(
                child: Text("$year",
                    style: TextStyle(
                      fontFamily: 'BalooBhai',
                      fontSize: 20,
                    )),
              ),
            ],
          ),
          Flexible(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Text("$inst",
                  style: TextStyle(
                    fontFamily: 'BalooBhai',
                    fontSize: 22,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
