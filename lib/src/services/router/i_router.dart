abstract interface class IRouter<TPath extends Enum> {
  Future<T?> goTo<T extends Object, P extends Object>(
    TPath route, {
    P? arguments,
  });

  void goBack<T extends Object?>({T? result});

  Future<T?> replaceLast<T extends Object, P extends Object>(
    TPath route, {
    P? arguments,
  });

  Future<T?> replaceAll<T extends Object, P extends Object>(
    TPath route, {
    P? arguments,
  });

  void goBackFirst();
}
