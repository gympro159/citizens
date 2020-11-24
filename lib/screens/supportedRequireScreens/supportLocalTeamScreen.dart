import 'package:flutter/material.dart';
import '../../utils/apiCaller.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportLocalTeamScreen extends StatefulWidget {
  SupportLocalTeamScreen({Key key}) : super(key: key);

  @override
  _SupportLocalTeamScreenState createState() => _SupportLocalTeamScreenState();
}

class _SupportLocalTeamScreenState extends State<SupportLocalTeamScreen> {
  List data;

  int _show = 0;

  @override
  void initState() {
    super.initState();
    callApi('quan').then((value) => {
          setState(() {
            data = value;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return data == null
        ? Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xff01A8A1)),
            ),
          )
        : ListView(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 20)),
              for (Map<String, dynamic> item in data)
                ListTile(
                  title: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 3,
                          ),
                          Container(
                            child: Center(
                                child: Text(
                              item["idQuan"],
                              style: TextStyle(color: Colors.white),
                            )),
                            padding: EdgeInsets.all(11.0),
                            decoration: BoxDecoration(
                              color: Color(0xffFD5C2C),
                            ),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Expanded(
                              child: Container(
                                  child: Text(item["tenQuan"],
                                      style: TextStyle(color: Colors.white)),
                                  padding: EdgeInsets.all(11.0),
                                  decoration:
                                      BoxDecoration(color: Color(0xffFD5C2C)))),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(padding: EdgeInsets.only(top: 8)),
                          for (Map<String, dynamic> elm in item["phuong"])
                            Row(children: [
                              Container(
                                  width: 40.5,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          right: BorderSide(
                                              color: Color(0xff848484),
                                              width: 0.3)))),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5)),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          Positioned(
                                            left: -5,
                                            top: 5,
                                            child: Container(
                                                width: 9,
                                                height: 9,
                                                decoration: BoxDecoration(
                                                    color: Color(0xffFD5C2C),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0))),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                elm["tenPhuong"],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      for (Map<String, dynamic> member
                                          in elm["sosMember"])
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5.0),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                        'lib/assets/images/iconsSOSTeam/person.png',
                                                        width: 12,
                                                        height: 12),
                                                    Text(member[
                                                        "nameSOSMember"]),
                                                  ],
                                                ),
                                                GestureDetector(
                                                  onTap: () => launch(
                                                      "tel://${member["phoneSOSMember"]}"),
                                                  child: Row(children: [
                                                    Image.asset(
                                                        'lib/assets/images/iconsSOSTeam/call.png',
                                                        width: 10,
                                                        height: 10),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 3)),
                                                    Text(
                                                        member[
                                                            "phoneSOSMember"],
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff008A1E))),
                                                  ]),
                                                )
                                              ]),
                                        )
                                    ],
                                  ),
                                ),
                              )
                            ])
                        ],
                      )
                    ],
                  ),
                  onTap: () {
                    print('Sun');
                  },
                ),
            ],
          );
  }
}
