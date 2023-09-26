part of 'extensions.dart';

extension PentaStringExtension on String {
  String get capatalize => this[0].toUpperCase() + substring(1);
  String get unCapatalize => this[0].toLowerCase() + substring(1);

  String get i18n => this.tr();
  String i18nWithArgs({List<String>? args, Map<String, String>? namedArgs}) =>
      this.tr(args: args, namedArgs: namedArgs);

  String get toSingleLine => replaceAll("\n", "{/n/}");
  String get toMultiLine => replaceAll("{/n/}", "\n");
  String get toSingleLineWithTrim => trim().toSingleLine;
  String get toMultiLineWithTrim => trim().toMultiLine;

  bool get isEmailValid => RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this);
}
