import 'package:flutter/material.dart';

class Experience extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              experience(),
              Container(
                  height: MediaQuery.of(context).size.height - 130,
                  child: ListView(
                    children: <Widget>[
                      Carde(
                        head: "Flutter Hackathon 2020",
                        exp: "48 Hours ",
                        body:
                            "Retro theme based Old Games we used to play before.",
                      ),
                      Carde(
                        head: "Research Internship",
                        exp: "1 month ",
                        body:
                            "Developing a Flutter App to help people to Understand how to pay Tax.",
                      ),
                      Carde(
                        head: "MediFo Android-Flutter",
                        exp: "3 months",
                        body:
                            "Medicine Information Through Image and Web Scrapping in Android-Flutter.",
                      ),
                      Carde(
                          head: "Timetable Management",
                          exp: "4 months",
                          body:
                              "Timetable Management System in Java using MySQL")
                    ],
                  ))
            ],
          ),
        ],
      ),
    );
  }

  Widget experience() {
    return Container(
        child: Text("PROJECTS",
            style: TextStyle(
              fontFamily: 'BalooBhai',
              fontSize: 50,
            )));
  }
}

class Carde extends StatelessWidget {
  final String head;
  final String exp;
  final String body;
  Carde(
      {this.head = 'Birth of Universe',
      this.body = "Text which goes inside the body appears over here.",
      this.exp = "2 M"});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xff60c9df),
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: ExpansionTile(
          //gif: gif,
          title: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  head,
                  style: TextStyle(
                    fontFamily: 'BalooBhai',
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                Text(
                  exp,
                  style: TextStyle(
                      fontFamily: 'BalooBhai',
                      fontSize: 20,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 7),
              child: Text(body,
                  style: TextStyle(
                      fontFamily: 'BalooBhai',
                      fontSize: 20,
                      color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
