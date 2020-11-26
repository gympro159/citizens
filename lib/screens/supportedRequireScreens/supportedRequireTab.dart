import 'package:citizens/widgets/appBar/appBar.dart';
import 'package:flutter/material.dart';
import 'createRequireScreen.dart';
import 'supportLocalTeamScreen.dart';

class SupportedRequireTab extends StatefulWidget {
  SupportedRequireTab({Key key}) : super(key: key);

  @override
  _SupportedRequireTabState createState() => _SupportedRequireTabState();
}

class _SupportedRequireTabState extends State<SupportedRequireTab> {
  int _currentIndex = 0;

  final screen = [CreateRequireScreen(), SupportLocalTeamScreen()];

  final title = ['Tạo yêu cầu hỗ trợ', 'Đội cứu hộ địa phương'];

  Widget handleIcon() {
    return GestureDetector(
        child: Image.asset('lib/assets/images/iconsCreateRequire/sent.png',
            fit: BoxFit.fill, height: 25),
        onTap: () {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: _currentIndex == 0
          ? GradientAppBar(title: title[0], handleIcon: handleIcon())
          : GradientAppBar(title: title[1]),
      body: screen[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xfff7f7f7),
          selectedItemColor: Color(0xff10A8A1),
          selectedFontSize: 13,
          unselectedFontSize: 13,
          items: [
            BottomNavigationBarItem(
                icon: Container(
                    width: 24,
                    height: 24,
                    child: Center(
                      child: Text(
                        'SOS',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 9),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xff727272),
                      border: Border.all(color: Color(0xff9C9C9C), width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                    )),
                activeIcon: Container(
                    width: 24,
                    height: 24,
                    child: Center(
                      child: Text(
                        'SOS',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 9),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xffEF0000),
                      border: Border.all(color: Color(0xffFF7474), width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                    )),
                label: 'Gửi yêu cầu',
                backgroundColor: Color(0xff10A8A1)),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'lib/assets/images/iconsSpRq/unselected.png',
                  width: 20.0,
                  height: 20.0,
                ),
                activeIcon: Image.asset(
                    'lib/assets/images/iconsSpRq/selected.png',
                    width: 20.0,
                    height: 20.0),
                label: 'Đội cứu hộ',
                backgroundColor: Color(0xff10A8A1))
          ],
          onTap: (index) => setState(() => _currentIndex = index)),
    );
  }
}
