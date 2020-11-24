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
              for (int i = 0; i < data.length; i++)
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
                              data[i]["idQuan"],
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
                                  child: Text(data[i]["tenQuan"],
                                      style: TextStyle(color: Colors.white)),
                                  padding: EdgeInsets.all(11.0),
                                  decoration:
                                      BoxDecoration(color: Color(0xffFD5C2C)))),
                        ],
                      ),
                      AnimatedContainer(
                        height: _show != i ? 0 : 200,
                        duration: Duration(milliseconds: 300),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(padding: EdgeInsets.only(top: 8)),
                              for (Map<String, dynamic> elm in data[i]
                                  ["phuong"])
                                IntrinsicHeight(
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                                width: 40.5,
                                                decoration: BoxDecoration(
                                                    border: Border(
                                                        right: BorderSide(
                                                            color: Color(
                                                                0xff848484),
                                                            width: 0.3)))),
                                            Positioned(
                                              right: 0,
                                              top: 6,
                                              child: Container(
                                                  width: 9,
                                                  height: 9,
                                                  decoration: BoxDecoration(
                                                      color: Color(0xffFD5C2C),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0))),
                                            ),
                                            Container(width: 44.5)
                                          ],
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5)),
                                        Expanded(
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Stack(
                                                  children: [
                                                    Text(
                                                      elm["tenPhuong"],
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18),
                                                    ),
                                                  ],
                                                ),
                                                for (Map<String, dynamic> member
                                                    in elm["sosMember"])
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 6.0),
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
                                                            child: Row(
                                                                children: [
                                                                  Image.asset(
                                                                      'lib/assets/images/iconsSOSTeam/call.png',
                                                                      width: 10,
                                                                      height:
                                                                          10),
                                                                  Padding(
                                                                      padding: EdgeInsets.only(
                                                                          right:
                                                                              3)),
                                                                  Text(
                                                                      member[
                                                                          "phoneSOSMember"],
                                                                      style: TextStyle(
                                                                          color:
                                                                              Color(0xff008A1E))),
                                                                ]),
                                                          )
                                                        ]),
                                                  ),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 8.0))
                                              ],
                                            ),
                                          ),
                                        )
                                      ]),
                                )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      _show != i ? _show = i : _show = -1;
                    });
                  },
                ),
            ],
          );
  }
}
