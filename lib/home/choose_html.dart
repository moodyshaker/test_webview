import 'package:flutter/material.dart';
import 'package:test_webview/core/router/router.dart';
import 'package:test_webview/home/home.dart';

class ChooseHtml extends StatelessWidget {
  const ChooseHtml({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                MagicRouter.navigateTo(Home(name: 'youtube'));
              },
              child: const Text('Youtube')),
          ElevatedButton(
              onPressed: () {
                MagicRouter.navigateTo(Home(name: 'article'));
              },
              child: const Text('Article')),
        ],
      ),
    ));
  }
}
