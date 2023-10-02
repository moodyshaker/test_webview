import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';
import '../constants.dart';

class Home extends StatefulWidget {
  final String name;

  Home({@required this.name});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  WebViewPlusController _controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomRight,
          children: [
            WebViewPlus(
              onWebResourceError: (WebResourceError error) {
                log('${error.errorCode}');
              },
              initialUrl: '${getHtml(widget.name)}?id=1203',
              navigationDelegate: (NavigationRequest request) async {
                log(request.url);
                return NavigationDecision.navigate;
              },
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated:
                  (WebViewPlusController webViewController) async {
                _controller = webViewController;
              },
              onPageFinished: (String s) async {},
              gestureNavigationEnabled: true,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: FloatingActionButton(
                      child: const Icon(Icons.dark_mode),
                      onPressed: () async{
                        _controller.webViewController.runJavascript(
                            'darkMode(true)');
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: FloatingActionButton(
                      child: const Icon(Icons.light_mode),
                      onPressed: () async{
                        _controller.webViewController.runJavascript(
                            'darkMode(false)');
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
