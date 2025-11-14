part of 'locale_manager.dart';

extension LocaleManagerProviderContextExtension on BuildContext {
  _LocaleManagerNotifier get localeManagerNotifierWatch =>
      LocaleManagerProvider.of(this);
  _LocaleManagerNotifier get localeManagerNotifierRead =>
      LocaleManagerProvider.maybeOf(this);
}

extension LocaleManagerProviderStringExtension on String {
  String translate<T extends Enum>(BuildContext context) {
    return context.localeManagerNotifierWatch.translate(this);
  }

  String translateWithArgs<T extends Enum>(
    BuildContext context,
    List<String> args,
  ) {
    return context.localeManagerNotifierWatch.translateWithArgs(this, args);
  }

  String translateWithNamedArgs<T extends Enum>(
    BuildContext context,
    Map<String, String> args,
  ) {
    return context.localeManagerNotifierWatch.translateWithNamedArgs(
      this,
      args,
    );
  }
}

extension LocaleManagerStringNoContextExtension on String {
  /// Translate using the globally registered notifier (no BuildContext).
  /// Returns the key itself if notifier is not registered.
  String tr<T extends Enum>() {
    final notifier = LocaleManager.I.notifier;
    if (notifier == null) return this;
    return notifier.translate(this);
  }

  String trWithArgs<T extends Enum>(List<String> args) {
    final notifier = LocaleManager.I.notifier;
    if (notifier == null) return this;
    return notifier.translateWithArgs(this, args);
  }

  String trWithNamedArgs<T extends Enum>(
    Map<String, String> args,
  ) {
    final notifier = LocaleManager.I.notifier;
    if (notifier == null) return this;
    return notifier.translateWithNamedArgs(this, args);
  }
}
