import 'package:citizens/screens/digitalMapScreen/digitalMapScreen.dart';
import 'package:citizens/screens/publicCameraScreen/publicCameraScreen.dart';
import 'package:citizens/screens/reactPhenomenaScreens/reactPhenomenaScreen.dart';
import 'package:citizens/screens/verifyNewsScreens/verifyNewsScreen.dart';
import 'package:citizens/screens/warningInfoScreens/warningInfoMenuScreen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../widgets/appBar/appBar.dart';
import '../widgets/home/buttomElement.dart';
import 'hotLineScreens/hotLineScreen.dart';
import 'supportedRequireScreens/supportedRequireTab.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    ReactPhenomenaScreen(title: 'Phản ánh hiện tượng'),
    VerifyNewsScreen(title: 'Xác minh tin tức'),
    WarningInfoMenuScreen(title: 'Thông tin cảnh báo'),
    DigitalMapScreen(title: 'Bản đồ số'),
    PublicCameraScreen(title: 'Camera công cộng'),
    HotLineScreen(title: 'Đường dây nóng'),
    SupportedRequireTab()
  ];

  final carouselImages = [
    'lib/assets/images/brand.png',
    'lib/assets/images/brand.png',
    'lib/assets/images/brand.png',
    'lib/assets/images/brand.png',
    'lib/assets/images/brand.png',
  ];
  int _currentImage = 0;

  void handleNavigation(context, page) =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: GradientAppBarHome(title: widget.title),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                      height: 90,
                      //aspectRatio: 16 / 9,
                      viewportFraction: 1.0,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      //reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      pauseAutoPlayOnTouch: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: false,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentImage = index;
                        });
                      }),
                  items: carouselImages.map((value) {
                    return Image.asset(
                      value,
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    );
                  }).toList(),
                ),
                Positioned.fill(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: carouselImages.asMap().entries.map((url) {
                            int index = url.key;
                            return Container(
                              width: 8.0,
                              height: 8.0,
                              margin: EdgeInsets.symmetric(
                                  vertical: 6.0, horizontal: 2.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(width: 1, color: Colors.white),
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: _currentImage == index
                                          ? [
                                              Color(0xff01A8A1),
                                              Color(0xff6ECC54)
                                            ]
                                          : [
                                              Colors.white,
                                              Colors.white,
                                            ])),
                            );
                          }).toList(),
                        )))
              ],
            ),
            Padding(padding: const EdgeInsets.only(top: 30.15)),
            Wrap(
              direction: Axis.horizontal,
              spacing: 20.0,
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 25.0),
        child: FloatingActionButton(
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
      ),
    );
  }
}
