
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Youtube extends StatefulWidget {
  final title;
  Youtube({this.title});
  @override
  _YoutubeState createState() => _YoutubeState();
}

class _YoutubeState extends State<Youtube> {
  Completer<WebViewController>_controller = Completer<WebViewController>();
  var url='https://www.youtube.com/results?search_query=';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: topAppBar,
      body: SafeArea(
        child: WebView(
          initialUrl: url+widget.title+'trailer',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webviewController) {
            _controller.complete(webviewController);
          },
        ),
      ),
    );
  }
}
