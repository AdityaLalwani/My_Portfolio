import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:flutter/material.dart';

final pages = [
  PageViewModel(
    pageColor: Color(0xff4B4E6D),
    body: Column(
      children: <Widget>[
        Text("Hello World !"),
      ],
    ),
    title: Text(
      '',
    ),
    titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    mainImage: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          child: FlareActor(
            'assets/animations/Bob.flr',
            alignment: Alignment.center,
            fit: BoxFit.cover,
            animation: 'Wave',
          ),
        ),
      ],
    ),
  ),
];
