import 'package:citizens/widgets/appBar/appBar.dart';
import 'package:flutter/material.dart';
import 'createRequireScreen.dart';
import 'supportLocalTeamScreen.dart';

class SupportedRequireTab extends StatefulWidget {
  SupportedRequireTab({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  _SupportedRequireTabState createState() => _SupportedRequireTabState();
}

class _SupportedRequireTabState extends State<SupportedRequireTab> {
  int _currentIndex = 0;

  final screen = [CreateRequireScreen(), SupportLocalTeamScreen()];

  final title = ['Tạo yêu cầu hỗ trợ', 'Đội cứu hộ địa phương'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(title: title[_currentIndex]),
      body: screen[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          iconSize: 40,
          items: [
            BottomNavigationBarItem(
                icon: Container(
                    width: 40,
                    child: Center(
                      child: Text(
                        'SOS',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xff727272),
                      border: Border.all(color: Color(0xff9C9C9C), width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    )),
                activeIcon: Container(child: Text('OSO')),
                label: 'Gửi yêu cầu',
                backgroundColor: Color(0xff10A8A1)),
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Gửi yêu cầu',
                backgroundColor: Color(0xff10A8A1))
          ],
          onTap: (index) => setState(() => _currentIndex = index)),
    );
  }
}
