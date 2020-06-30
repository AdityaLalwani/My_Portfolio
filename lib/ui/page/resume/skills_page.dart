import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class Skills extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Text("SKILLS",
                  style: TextStyle(
                    fontFamily: 'BalooBhai',
                    fontSize: 50,
                  )),
              Skill(
                size: 170,
                score: 85,
              ),
              Wrap(
                children: <Widget>[
                  Skill(
                    score: 70,
                    skills: "Java",
                  ),
                  Skill(
                    score: 80,
                    skills: "Html/Css",
                  ),
                  Skill(
                    score: 70,
                    skills: "JavaScript",
                  ),
                  Skill(
                    score: 80,
                    skills: "MySQL",
                  ),
                ],
              ),
              Skill(
                score: 70,
                skills: "Network",
              )
            ],
          )),
    );
  }
}

// ignore: must_be_immutable
class Skill extends StatefulWidget {
  Color baseColor;
  String skills;
  double width;
  double handleWidth;
  double size;
  double score;
  Skill(
      {this.skills = "Android",
      this.baseColor = const Color(0xff303187),
      this.width = 16,
      this.handleWidth = 6,
      this.size = 150,
      this.score = 50});
  @override
  _SkillState createState() => _SkillState();
}

class _SkillState extends State<Skill> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: SleekCircularSlider(
        initialValue: widget.score,
        innerWidget: inner,
        appearance: CircularSliderAppearance(
            size: widget.size,
            customColors: CustomSliderColors(
              trackColor: widget.baseColor,
            ),
            angleRange: 245,
            startAngle: 150,
            customWidths: CustomSliderWidths(
                progressBarWidth: widget.width,
                handlerSize: widget.handleWidth,
                shadowWidth: 35)),
      ),
    );
  }

  Widget inner(double i) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        "${widget.skills}\n${i.toInt()}",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'BalooBhai',
          fontSize: 25,
        ),
      ),
    );
  }
}
