import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:portfolioavi/ui/widget/bottom_page_text.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Observer(builder: (_) {
            return Container(
              child: Image.asset(
                "assets/animations/planets.gif",
                fit: BoxFit.cover,
              ),
            );
          }),
          Container(
            margin: EdgeInsets.only(top: 100),
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                AnimatedCircularGlow(
                  endRadius: 120.0,
                  duration: Duration(milliseconds: 2000),
                  repeat: true,
                  repeatPause: Duration(milliseconds: 100),
                  child: Material(
                    elevation: 8.0,
                    shape: CircleBorder(),
                    color: Colors.transparent,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/avi.jpg'),
                      radius: 80.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: 100),
            child: Text(
              "Hi there!\n I am Aditya Lalwani",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white.withOpacity(0.87),
                fontWeight: FontWeight.w700,
                fontSize: 35.0,
              ),
            ),
          ),
          BottomPageText("Intro"),
        ],
      ),
    );
  }
}

class AnimatedCircularGlow extends StatefulWidget {
  final bool repeat;
  final Duration duration;
  final double endRadius;

  final Duration repeatPause;

  final Widget child;

  AnimatedCircularGlow(
      {this.endRadius,
      this.duration,
      this.repeat,
      this.repeatPause,
      @required this.child});

  @override
  _AnimatedCircularGlowState createState() => _AnimatedCircularGlowState();
}

class _AnimatedCircularGlowState extends State<AnimatedCircularGlow>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  Animation<double> animation2;
  Animation<double> alphaAnimation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: widget.duration, vsync: this);
    final Animation curve =
        CurvedAnimation(parent: controller, curve: Curves.decelerate);
    animation = Tween(
            begin: (widget.endRadius * 2) / 6,
            end: (widget.endRadius * 2) * (3 / 4))
        .animate(curve)
          ..addListener(() {
            setState(() {});
          });
    animation2 = Tween(begin: 0.0, end: (widget.endRadius * 2)).animate(curve)
      ..addListener(() {
        setState(() {});
      });

    alphaAnimation = Tween(begin: 0.30, end: 0.0).animate(controller);
    controller.addStatusListener((_) async {
      if (controller.status == AnimationStatus.completed) {
        await Future.delayed(widget.repeatPause);
        controller.reset();
        controller.forward();
      }
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
      height: widget.endRadius * 2,
      width: widget.endRadius * 2,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            height: animation2.value,
            width: animation2.value,
            child: SizedBox(),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(alphaAnimation.value)),
          ),
          Container(
            height: animation.value,
            width: animation.value,
            child: SizedBox(),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(alphaAnimation.value)),
          ),
          widget.child,
        ],
      ),
    );
  }
}
