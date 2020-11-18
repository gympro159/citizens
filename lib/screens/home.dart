import 'package:flutter/material.dart';
import './../widgets/home/appBar.dart';
import './../widgets//home//buttomElement.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'CITIZENS APP'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({this.title});
  final String title;
  final int blueColor = 0xff01A8A1, greenColor = 0xff6ECC54;
  final imageButtons = [
    'assets/images/icons/react.png',
    'assets/images/icons/verification.png',
    'assets/images/icons/danger.png',
    'assets/images/icons/place.png',
    'assets/images/icons/camera.png',
    'assets/images/icons/hot-line.png',
    'assets/images/icons/sos.png'
  ];
  final titleButtons = [
    'Phản ánh \nhiện tượng',
    'Xác minh \ntin tức',
    'Thông tin \ncảnh báo',
    'Bản đồ số',
    'Camera \ncông cộng',
    'Đường dây\nnóng',
    'Yêu cầu \nhỗ trợ'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(title: title),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              'assets/images/brand.png',
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            Padding(padding: const EdgeInsets.only(top: 30.15)),
            Wrap(
              direction: Axis.horizontal,
              children: <Widget>[
                for (var i = 0; i < titleButtons.length; i++)
                  ButtonElement(
                      imageButtons: imageButtons[i],
                      titleButtons: titleButtons[i])
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'sos',
        foregroundColor: Colors.white,
        backgroundColor: Color(0xffF92525),
        child: Text(
          'SOS',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            side: BorderSide(width: 4.0, color: Color(0xffFF9898))),
      ),
    );
  }
}
