
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CorWebView extends StatefulWidget {
  @override
  _CorWebViewState createState() => _CorWebViewState();
}

class _CorWebViewState extends State<CorWebView> {
  Completer<WebViewController>_controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: topAppBar,
      body: SafeArea(
        child: WebView(
          initialUrl: "https://netflix-unique.web.app/",
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webviewController) {
            _controller.complete(webviewController);
          },
        ),
      ),
    );
  }
}
