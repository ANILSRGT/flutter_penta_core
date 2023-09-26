abstract interface class IPentaRouteService {
  void pushNamed(String routeName, {Object? arguments});
  void pushReplacementNamed(String routeName, {Object? arguments});
  void popUntil(String routeName);
  void pop();
  void popAndPushNamed(String routeName, {Object? arguments});
  void pushNamedAndRemoveUntil(String routeName, {Object? arguments});
  void restorablePushNamed(String routeName, {Object? arguments});
  void restorablePushNamedAndRemoveUntil(
    String newRouteName,
    bool predicate, {
    Object? arguments,
  });
  void restorablePopAndPushNamed<TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  });
  void restorablePushReplacementNamed<TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  });
}
