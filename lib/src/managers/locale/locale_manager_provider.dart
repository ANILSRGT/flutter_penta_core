part of 'locale_manager.dart';

class LocaleManagerProvider extends InheritedNotifier<_LocaleManagerNotifier> {
  const LocaleManagerProvider._({
    required _LocaleManagerNotifier super.notifier,
    required super.child,
  });

  factory LocaleManagerProvider.create({
    required Enum defaultLocale,
    required Widget child,
  }) {
    final notifier = _LocaleManagerNotifier(defaultLocale: defaultLocale);
    // Register notifier to LocaleManager singleton so translations
    // can be performed without BuildContext when needed.
    LocaleManager.I._registerNotifier(notifier);
    return LocaleManagerProvider._(notifier: notifier, child: child);
  }

  static _LocaleManagerNotifier of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<LocaleManagerProvider>()!
        .notifier!;
  }

  static _LocaleManagerNotifier maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<LocaleManagerProvider>()!
        .notifier!;
  }
}
