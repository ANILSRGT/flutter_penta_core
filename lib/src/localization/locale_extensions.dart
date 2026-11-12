part of 'locale_manager.dart';

extension LocaleManagerProviderContextExtension on BuildContext {
  /// Locale controller; the widget rebuilds when the locale changes.
  LocaleController<Enum> get localeManagerNotifierWatch =>
      LocaleManagerProvider.of(this);

  /// Locale controller without rebuilding; use inside callbacks.
  LocaleController<Enum> get localeManagerNotifierRead =>
      LocaleManagerProvider.read(this);
}

/// Translation helpers that rebuild the calling widget on locale change.
extension LocaleManagerProviderStringExtension on String {
  String translate(BuildContext context) =>
      context.localeManagerNotifierWatch.translate(this);

  String translateWithArgs(BuildContext context, List<Object?> args) =>
      context.localeManagerNotifierWatch.translateWithArgs(this, args);

  String translateWithNamedArgs(
    BuildContext context,
    Map<String, Object?> args,
  ) => context.localeManagerNotifierWatch.translateWithNamedArgs(this, args);
}

/// Context-less translation helpers using the controller of the mounted
/// [LocaleManagerProvider].
///
/// They do not subscribe to locale changes by themselves. Inside widgets
/// that must update on locale change, either use the `translate*(context)`
/// variants or make sure an ancestor rebuilds (e.g. `MaterialApp` reading
/// `context.localeManagerNotifierWatch`).
///
/// Before the provider is mounted, the key is returned unchanged.
extension LocaleManagerStringNoContextExtension on String {
  String tr() => LocaleManager.I.controller?.translate(this) ?? this;

  String trWithArgs(List<Object?> args) =>
      LocaleManager.I.controller?.translateWithArgs(this, args) ?? this;

  String trWithNamedArgs(Map<String, Object?> args) =>
      LocaleManager.I.controller?.translateWithNamedArgs(this, args) ?? this;
}
