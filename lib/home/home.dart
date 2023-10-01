import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';
import '../constants.dart';

class Home extends StatefulWidget {
  final String name;

  Home({required this.name});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late WebViewPlusController _controller;
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: WebViewPlus(
            onWebResourceError: (WebResourceError error) {
              log('${error.errorCode}');
            },
            initialUrl: getHtml(widget.name) + '?id=1203',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewPlusController webViewController) async {
              _controller = webViewController;
            },
            onPageFinished: (String s) async {
              setState(() {
                _isLoading = false;
              });
            },
            gestureNavigationEnabled: true,
          )
      ),
    );
  }
}
