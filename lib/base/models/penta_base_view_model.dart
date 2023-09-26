import 'package:flutter/material.dart';

abstract class PentaBaseViewModel {
  late BuildContext viewModelContext;

  void setContext(BuildContext context);
  void init();
}
