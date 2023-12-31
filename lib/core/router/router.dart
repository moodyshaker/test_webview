import 'package:flutter/cupertino.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MagicRouter {
  static BuildContext currentContext = navigatorKey.currentContext;

  static Future<dynamic> navigateTo(Widget page) =>
      navigatorKey.currentState.push(_materialPageRoute(page));

  static Future<dynamic> navigateAndPopAll(Widget page) =>
      navigatorKey.currentState.pushAndRemoveUntil(
        _materialPageRoute(page),
        (_) => false,
      );

  static Future<dynamic> navigateAndPopUntilFirstPage(Widget page) =>
      navigatorKey.currentState.pushAndRemoveUntil(
          _materialPageRoute(page), (route) => route.isFirst);

  static Future<dynamic> navigateAndPop(Widget page) =>
      navigatorKey.currentState.pushReplacement(_materialPageRoute(page));

  static void pop() => navigatorKey.currentState.pop();

  static Route<dynamic> _materialPageRoute(Widget page) =>
      CupertinoPageRoute(builder: (_) => page);
}
