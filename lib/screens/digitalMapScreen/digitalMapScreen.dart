import 'package:citizens/widgets/appBar/appBar.dart';
import 'package:flutter/material.dart';

class DigitalMapScreen extends StatelessWidget {
  const DigitalMapScreen({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: GradientAppBar(title: title),
      body: Center(child: Text(title)),
    );
  }
}
