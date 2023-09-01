import 'package:flutter/material.dart';

import 'iroute_service.dart';

class MaterialRouteService implements IRouteService {
  final GlobalKey<NavigatorState> navigatorKey;
  const MaterialRouteService(this.navigatorKey);

  @override
  void pop() {
    navigatorKey.currentState!.pop();
  }

  @override
  void popAndPushNamed(String routeName, {Object? arguments}) {
    navigatorKey.currentState!.popAndPushNamed(routeName, arguments: arguments);
  }

  @override
  void popUntil(String routeName) {
    navigatorKey.currentState!.popUntil(ModalRoute.withName(routeName));
  }

  @override
  void pushNamed(String routeName, {Object? arguments}) {
    navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
  }

  @override
  void pushNamedAndRemoveUntil(String routeName, {Object? arguments}) {
    navigatorKey.currentState!
        .pushNamedAndRemoveUntil(routeName, (_) => false, arguments: arguments);
  }

  @override
  void pushReplacementNamed(String routeName, {Object? arguments}) {
    navigatorKey.currentState!.pushReplacementNamed(routeName, arguments: arguments);
  }

  @override
  void restorablePopAndPushNamed<TO extends Object?>(String routeName,
      {TO? result, Object? arguments}) {
    navigatorKey.currentState!
        .restorablePopAndPushNamed(routeName, result: result, arguments: arguments);
  }

  @override
  void restorablePushNamed(String routeName, {Object? arguments}) {
    navigatorKey.currentState!.restorablePushNamed(routeName, arguments: arguments);
  }

  @override
  void restorablePushNamedAndRemoveUntil(String newRouteName, bool predicate, {Object? arguments}) {
    navigatorKey.currentState!
        .restorablePushNamedAndRemoveUntil(newRouteName, (_) => predicate, arguments: arguments);
  }

  @override
  void restorablePushReplacementNamed<TO extends Object?>(String routeName,
      {TO? result, Object? arguments}) {
    navigatorKey.currentState!
        .restorablePushReplacementNamed(routeName, result: result, arguments: arguments);
  }
}
