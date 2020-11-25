import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SOSTeamElement extends StatelessWidget {
  const SOSTeamElement({
    Key key,
    @required this.elm,
  }) : super(key: key);

  final Map<String, dynamic> elm;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Stack(
          children: [
            Container(
                width: 40.5,
                decoration: BoxDecoration(
                    border: Border(
                        right:
                            BorderSide(color: Color(0xff848484), width: 0.3)))),
            Positioned(
              right: 0,
              top: 6,
              child: Container(
                  width: 9,
                  height: 9,
                  decoration: BoxDecoration(
                      color: Color(0xffFD5C2C),
                      borderRadius: BorderRadius.circular(10.0))),
            ),
            Container(width: 44.5)
          ],
        ),
        Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
        Expanded(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Text(
                      elm["tenPhuong"],
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
                for (Map<String, dynamic> member in elm["sosMember"])
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                  'lib/assets/images/iconsSOSTeam/person.png',
                                  width: 12,
                                  height: 12),
                              Text(member["nameSOSMember"]),
                            ],
                          ),
                          GestureDetector(
                            onTap: () =>
                                launch("tel://${member["phoneSOSMember"]}"),
                            child: Row(children: [
                              Image.asset(
                                  'lib/assets/images/iconsSOSTeam/call.png',
                                  width: 10,
                                  height: 10),
                              Padding(padding: EdgeInsets.only(right: 3)),
                              Text(member["phoneSOSMember"],
                                  style: TextStyle(color: Color(0xff008A1E))),
                            ]),
                          )
                        ]),
                  ),
                Padding(padding: EdgeInsets.only(bottom: 8.0))
              ],
            ),
          ),
        )
      ]),
    );
  }
}
