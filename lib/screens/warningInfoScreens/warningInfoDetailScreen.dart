import 'package:flutter/material.dart';
import 'package:citizens/widgets/appBar/appBar.dart';
import 'warningInfoWebView.dart';

class WarningInfoDetailScreen extends StatelessWidget {
  const WarningInfoDetailScreen({Key key, @required this.warningInfoDetail})
      : super(key: key);

  final Map<String, dynamic> warningInfoDetail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(title: 'Chi tiết cảnh báo'),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(warningInfoDetail["title"],
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        height: 1.5)),
                SizedBox(height: 22),
                Container(
                  width: double.infinity,
                  child: Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      direction: Axis.horizontal,
                      runSpacing: 22,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Chuyên mục'),
                            Text(warningInfoDetail["type"]["nameType"],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    height: 1.5))
                          ],
                        ),
                        SizedBox(
                          width: 110,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Mức độ'),
                              Text(warningInfoDetail["rate"]["nameRate"],
                                  style: TextStyle(
                                      color: warningInfoDetail["rate"]
                                                  ["idRate"] ==
                                              "1"
                                          ? Color(0xffFF0000)
                                          : Colors.orange,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      height: 1.5))
                            ],
                          ),
                        )
                      ]),
                ),
                SizedBox(height: 22),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Thời gian đăng'),
                    Text(warningInfoDetail["time"],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            height: 1.5))
                  ],
                ),
                SizedBox(height: 22),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Đơn vị đăng'),
                    Text(warningInfoDetail["depart"]["nameDepart"],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            height: 1.5))
                  ],
                ),
                SizedBox(height: 22),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nội dung'),
                    Text(warningInfoDetail["content"],
                        style: TextStyle(fontSize: 20, height: 1.5))
                  ],
                ),
                SizedBox(height: 22),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('File đính kèm'),
                    warningInfoDetail["attach"] != null
                        ? GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          WarningInfoWebViewScreen(
                                              attach: warningInfoDetail[
                                                  "attach"])));
                            },
                            child: Row(
                              children: [
                                Icon(Icons.save_alt,
                                    color: Color(0xff0500e3), size: 20),
                                SizedBox(width: 10),
                                Text('Tải xuống',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        height: 1.5,
                                        color: Color(0xff0500e3)))
                              ],
                            ),
                          )
                        : SizedBox()
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
