import 'package:citizens/screens/warningInfoScreens/warningInfoDetailScreen.dart';
import 'package:flutter/material.dart';

class WarningInfoCard extends StatelessWidget {
  const WarningInfoCard(
      {Key key, @required this.warninginfoFilter, @required this.index})
      : super(key: key);

  final List warninginfoFilter;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WarningInfoDetailScreen(
                    warningInfoDetail: warninginfoFilter[index])));
      },
      child: Container(
          margin: EdgeInsets.only(top: 3),
          padding: EdgeInsets.only(top: 25),
          color: index % 3 == 2 ? Color(0x26FF7A7A) : Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color(0xff01A8A1), Color(0xff54CC82)],
                                begin: const FractionalOffset(0.5, 0.0),
                                end: const FractionalOffset(0.5, 1.0),
                                stops: [0.0, 1.0],
                                tileMode: TileMode.clamp),
                            borderRadius: BorderRadius.circular(12)),
                        child: Container(
                          child: Image.asset(
                            'lib/assets/images/iconsWarningInfo/icon_${warninginfoFilter[index]["type"]["idType"]}.png',
                            fit: BoxFit.fill,
                            height: 30,
                          ),
                          constraints:
                              BoxConstraints(maxWidth: 40, maxHeight: 40),
                          alignment: Alignment.center,
                        )),
                  ),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              '${warninginfoFilter[index]["type"]["nameType"]}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text(
                                  '${warninginfoFilter[index]["title"]}',
                                  style: TextStyle(fontSize: 17))),
                        ]),
                  ),
                  Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 30,
                  )
                ]),
                SizedBox(height: 20),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('lib/assets/images/iconsWarningInfo/time.png',
                          fit: BoxFit.fill, height: 20),
                      SizedBox(width: 10),
                      Text('${warninginfoFilter[index]["time"]}',
                          style: TextStyle(
                              color: Color(0xff4d4c4c), fontSize: 17)),
                      SizedBox(width: 45)
                    ]),
                SizedBox(height: 10),
                Divider(
                  color: Colors.black.withOpacity(0.3),
                  thickness: 0.3,
                  height: 0,
                  indent: 20,
                  endIndent: 20,
                )
              ],
            ),
          )),
    );
  }
}
