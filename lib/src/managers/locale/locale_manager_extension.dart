part of 'locale_manager.dart';

extension LocaleManagerProviderContextExtension on BuildContext {
  _LocaleManagerNotifier localeManagerNotifierWatch() =>
      LocaleManagerProvider.of(this);
  _LocaleManagerNotifier localeManagerNotifierRead() =>
      LocaleManagerProvider.maybeOf(this);
}

extension LocaleManagerProviderStringExtension on String {
  String translate<T extends Enum>(BuildContext context) {
    return context.localeManagerNotifierWatch().translate(this);
  }

  String translateWithArgs<T extends Enum>(
    BuildContext context,
    List<String> args,
  ) {
    return context.localeManagerNotifierWatch().translateWithArgs(this, args);
  }
}
