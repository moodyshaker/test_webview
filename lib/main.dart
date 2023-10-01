import 'package:flutter/material.dart';
import 'package:test_webview/core/router/router.dart';
import 'package:test_webview/home/choose_html.dart';

import 'home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: ChooseHtml(),
    );
  }
}
