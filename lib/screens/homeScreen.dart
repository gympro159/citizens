import 'package:citizens/screens/warningInfoScreens/warningInfoMenuScreen.dart';
import 'package:flutter/material.dart';
import '../widgets/appBar/appBar.dart';
import '../widgets/home/buttomElement.dart';
import 'hotLineScreens/hotLineScreen.dart';
import 'supportedRequireScreens/supportedRequireTab.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({this.title});
  final String title;
  final int blueColor = 0xff01A8A1, greenColor = 0xff6ECC54;
  final imageButtons = [
    'lib/assets/images/iconsHome/react.png',
    'lib/assets/images/iconsHome/verification.png',
    'lib/assets/images/iconsHome/danger.png',
    'lib/assets/images/iconsHome/place.png',
    'lib/assets/images/iconsHome/camera.png',
    'lib/assets/images/iconsHome/hot-line.png',
    'lib/assets/images/iconsHome/sos.png'
  ];
  final List<String> titleButtons = [
    'Phản ánh \nhiện tượng',
    'Xác minh \ntin tức',
    'Thông tin \ncảnh báo',
    'Bản đồ số',
    'Camera \ncông cộng',
    'Đường dây\nnóng',
    'Yêu cầu \nhỗ trợ'
  ];
  final pageNavigator = [
    HotLineScreen(title: 'Phản ánh hiện tượng'),
    HotLineScreen(title: 'Xác minh tin tức'),
    WarningInfoMenuScreen(title: 'Thông tin cảnh báo'),
    HotLineScreen(title: 'Bản đồ số'),
    HotLineScreen(title: 'Camera công cộng'),
    HotLineScreen(title: 'Đường dây nóng'),
    SupportedRequireTab()
  ];

  void handleNavigation(context, page) =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: GradientAppBarHome(title: title),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              'lib/assets/images/brand.png',
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            Padding(padding: const EdgeInsets.only(top: 30.15)),
            Wrap(
              direction: Axis.horizontal,
              spacing: 10.0,
              runSpacing: 20.0,
              children: <Widget>[
                for (var i = 0; i < titleButtons.length; i++)
                  ButtonElement(
                      imageButtons: imageButtons[i],
                      titleButtons: titleButtons[i],
                      handleNavigation: () =>
                          handleNavigation(context, pageNavigator[i]))
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => handleNavigation(context, SupportedRequireTab()),
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
