import 'dart:async';

import 'package:flutter/material.dart';
import '../../widgets/appBar/appBar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WarningInfoWebViewScreen extends StatelessWidget {
  WarningInfoWebViewScreen({Key key, @required this.attach}) : super(key: key);

  final String attach;

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(title: 'File đính kèm'),
        body: WebView(
          initialUrl: 'http://google.com',
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ));
  }
}
