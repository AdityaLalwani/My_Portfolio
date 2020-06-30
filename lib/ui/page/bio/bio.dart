import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:portfolioavi/ui/page/bio/about_page.dart';

class Bio extends StatefulWidget {
  @override
  _BioState createState() => _BioState();
}

class _BioState extends State<Bio> {
  void smileTeddy() {
    Future.delayed(Duration(milliseconds: 3000), () {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    smileTeddy();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff8E24AA),
        body: Container(
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(top: 50),
                      alignment: Alignment.bottomCenter,
                      height: 250,
                      child: Observer(
                        builder: (_) {
                          return Image.asset(
                            "assets/animations/About.gif",
                            fit: BoxFit.cover,
                          );
                        },
                      )),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
                child: About(),
              )
            ],
          ),
        ));
  }
}
