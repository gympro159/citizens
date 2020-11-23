import 'package:flutter/material.dart';
import '../../utils/apiCaller.dart';

class SupportLocalTeamScreen extends StatefulWidget {
  SupportLocalTeamScreen({Key key}) : super(key: key);

  @override
  _SupportLocalTeamScreenState createState() => _SupportLocalTeamScreenState();
}

class _SupportLocalTeamScreenState extends State<SupportLocalTeamScreen> {
  List data;

  @override
  void initState() {
    super.initState();
    callApi('SOSTeam_Quan').then((value) => {
          setState(() {
            data = value;
          }),
          print(value)
        });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          for (int i = 0; i < 10; i++)
            if (data == null) Text('null') else Text(data[i]),
        ],
      ),
    );
  }
}
