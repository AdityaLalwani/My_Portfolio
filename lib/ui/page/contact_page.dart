import 'package:flutter/material.dart';
import 'package:portfolioavi/ui/widget/bottom_page_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class ContactPage extends StatelessWidget {
  var color = Color(0xffee5253);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffee5253),
      child: Stack(
        children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/animations/Logo.gif",
                fit: BoxFit.fitWidth,
              )),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 480),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        "+91-9510592880",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontWeight: FontWeight.w700,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                    mainAxisSize: MainAxisSize.min,
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "adityalalwani86@gmail.com",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontWeight: FontWeight.w700,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                    mainAxisSize: MainAxisSize.min,
                  ),
                  SizedBox(
                    height: 32.0,
                  ),
                  Row(
                    children: <Widget>[
                      CircularButton(FontAwesomeIcons.linkedin,
                          "https://www.linkedin.com/in/aditya-lalwani-ab1249169/"),
                      HorizontalSpacing(),
                      CircularButton(FontAwesomeIcons.instagram,
                          "https://www.instagram.com/aditya_l_007/"),
                      HorizontalSpacing(),
                      CircularButton(FontAwesomeIcons.github,
                          "https://github.com/AdityaLalwani"),
                    ],
                    mainAxisSize: MainAxisSize.min,
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    children: <Widget>[
                      CircularButton(FontAwesomeIcons.twitter,
                          "https://twitter.com/AdityaLalwani6"),
                      HorizontalSpacing(),
                      CircularButton(FontAwesomeIcons.envelope,
                          "mailto:adityalalwani86@gmail.com"),
                    ],
                    mainAxisSize: MainAxisSize.min,
                  ),
                  SizedBox(
                    height: 64.0,
                  ),
                ],
              ),
            ),
          ),
          BottomPageText("Contact"),
        ],
      ),
    );
  }
}

class HorizontalSpacing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 32.0,
    );
  }
}

class CircularButton extends StatefulWidget {
  final IconData iconData;

  final String url;

  CircularButton(this.iconData, this.url);

  @override
  CircularButtonState createState() {
    return new CircularButtonState();
  }
}

class CircularButtonState extends State<CircularButton>
    with SingleTickerProviderStateMixin {
  final Color color = Color(0xffee5253);
  Animation animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    final Animation curve =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);
    animation = Tween(begin: 4.0, end: 4.0).animate(curve);

    controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await Future.delayed(Duration(seconds: 1));
        if (controller != null) {
          controller.reset();
          controller.forward();
        }
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });

    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: animation.value),
      height: 40.0,
      child: FloatingActionButton(
        onPressed: () {
          _launchURL(widget.url);
        },
        mini: true,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: animation.value),
          child: Icon(
            widget.iconData,
            color: color,
          ),
        ),
        backgroundColor: Colors.white.withOpacity(0.9),
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
