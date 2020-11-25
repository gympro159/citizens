import 'package:flutter/material.dart';

class GradientAppBarHome extends StatelessWidget
    implements PreferredSizeWidget {
  GradientAppBarHome({this.title});
  final String title;
  final double barHeight = 50.0;
  final int blueColor = 0xff01A8A1, greenColor = 0xff6ECC54;

  @override
  Size get preferredSize => Size.fromHeight(barHeight);

  @override
  Widget build(BuildContext context) {
    return new AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                  size: 35.0,
                )),
            Text(title,
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            Padding(padding: EdgeInsets.only(left: 21.8)),
          ],
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(blueColor), Color(greenColor)],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(0.9, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ));
  }
}

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  GradientAppBar({this.title, this.handleIcon});
  final String title;
  final double barHeight = 50.0;
  final int blueColor = 0xff01A8A1, greenColor = 0xff6ECC54;
  final Widget handleIcon;
  @override
  Size get preferredSize => Size.fromHeight(barHeight);

  @override
  Widget build(BuildContext context) {
    return new AppBar(
        centerTitle: true,
        title: this.handleIcon == null
            ? Text(title,
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold))
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(),
                  Text(title,
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  handleIcon
                ],
              ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(blueColor), Color(greenColor)],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(0.9, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ));
  }
}
