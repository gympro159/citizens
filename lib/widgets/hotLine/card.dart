import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CardHotLine extends StatelessWidget {
  const CardHotLine(
      {Key key,
      @required this.icon,
      @required this.title,
      @required this.phone,
      @required this.color1,
      @required this.color2,
      @required this.begin1,
      @required this.begin2,
      @required this.end1,
      @required this.end2})
      : super(key: key);

  final String icon, title, phone;
  final int color1, color2;
  final double begin1, begin2, end1, end2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 6.5),
      child: GestureDetector(
        onTap: () => launch("tel://$phone"),
        child: new Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
                colors: [Color(color1), Color(color2)],
                begin: FractionalOffset(begin2, begin1),
                end: FractionalOffset(end2, end1),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Image.asset(
                  icon,
                  width: 80,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(phone,
                            style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.bold))
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
