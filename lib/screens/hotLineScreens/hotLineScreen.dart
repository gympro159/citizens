import 'package:citizens/widgets/appBar/appBar.dart';
import 'package:flutter/material.dart';
import '../../widgets/hotLine/card.dart';

class HotLineScreen extends StatelessWidget {
  HotLineScreen({Key key, @required this.title}) : super(key: key);

  final String title;

  final icons = [
    'lib/assets/images/cardsHotLine/112.png',
    'lib/assets/images/cardsHotLine/113.png',
    'lib/assets/images/cardsHotLine/114.png',
    'lib/assets/images/cardsHotLine/115.png'
  ];

  final titles = ['TÌM KIẾM CỨU NẠN', 'CẢNH SÁT', 'CỨU HỎA', 'CẤP CỨU'];

  final phones = ['112', '113', '114', '115'];

  final color1s = [0xff00B09B, 0xff182848, 0xffD31027, 0xffFF512F];

  final color2s = [0xff96C93D, 0xff4B6CB7, 0xffEA384D, 0xffF09819];

  final begin1s = [0.5, 1.0, 1.0, 0.5];
  final begin2s = [0.0, 0.5, 0.5, 0.0];
  final end1s = [0.5, 0.0, 0.0, 0.5];
  final end2s = [1.0, 0.5, 0.5, 1.0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(title: title),
      body: Center(
          child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 24.0)),
          for (int i = 0; i < titles.length; i++)
            CardHotLine(
                icon: icons[i],
                title: titles[i],
                phone: phones[i],
                color1: color1s[i],
                color2: color2s[i],
                begin1: begin1s[i],
                begin2: begin2s[i],
                end1: end1s[i],
                end2: end2s[i])
        ],
      )),
    );
  }
}
