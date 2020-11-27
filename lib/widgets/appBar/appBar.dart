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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {},
                child: Container(
                    width: 35,
                    height: 35,
                    padding: EdgeInsets.symmetric(horizontal: 1.3),
                    decoration: BoxDecoration(
                      border: Border.all(width: 4.0, color: Colors.white),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          top: 3,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                        Positioned.fill(
                            bottom: -26.5,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                  width: 38,
                                  height: 38,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20))),
                            ))
                      ],
                    ))),
            Text(title,
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            GestureDetector(
                onTap: () {},
                child: Image.asset(
                    'lib/assets/images/iconsHome/notification.png',
                    fit: BoxFit.fill,
                    height: 28)),
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
    return PreferredSize(
      preferredSize: Size.fromHeight(200.0),
      child: AppBar(
          automaticallyImplyLeading: false, // hides leading widget
          leading: IconButton(
            icon: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Icon(Icons.arrow_back_ios, color: Colors.white),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
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
          )),
    );
  }
}
