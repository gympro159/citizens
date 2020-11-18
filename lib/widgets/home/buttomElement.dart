import 'package:flutter/material.dart';

class ButtonElement extends StatelessWidget {
  const ButtonElement({
    Key key,
    @required this.imageButtons,
    @required this.titleButtons,
  }) : super(key: key);

  final String imageButtons;
  final String titleButtons;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Column(
        children: [
          FlatButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.all(1),
            child: Column(
              children: [
                Ink(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xff01A8A1), Color(0xff6ECC54)],
                            begin: const FractionalOffset(0.5, 0.0),
                            end: const FractionalOffset(0.5, 1.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      child: Image.asset(imageButtons),
                      constraints: BoxConstraints(maxWidth: 35, maxHeight: 35),
                      alignment: Alignment.center,
                    )),
                Padding(padding: const EdgeInsets.only(top: 5)),
                Text(titleButtons,
                    textAlign: TextAlign.center, style: TextStyle(fontSize: 13))
              ],
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}