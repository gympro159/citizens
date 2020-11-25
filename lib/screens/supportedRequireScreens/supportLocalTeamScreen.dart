import 'package:flutter/material.dart';
import '../../utils/apiCaller.dart';
import '../../widgets/supportLocalTeam/sosTeamElement.dart';

class SupportLocalTeamScreen extends StatefulWidget {
  SupportLocalTeamScreen({Key key}) : super(key: key);

  @override
  _SupportLocalTeamScreenState createState() => _SupportLocalTeamScreenState();
}

class _SupportLocalTeamScreenState extends State<SupportLocalTeamScreen>
    with TickerProviderStateMixin {
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
                      AnimatedSize(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.fastOutSlowIn,
                        vsync: this,
                        child: Column(
                          children: _show != i
                              ? [SizedBox()]
                              : [
                                  Padding(padding: EdgeInsets.only(top: 8)),
                                  for (Map<String, dynamic> elm in data[i]
                                      ["phuong"])
                                    SOSTeamElement(elm: elm)
                                ],
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
