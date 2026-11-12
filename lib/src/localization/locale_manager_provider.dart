part of 'locale_manager.dart';

/// Provides a [LocaleController] to the widget tree and rebuilds dependents
/// when the locale changes. Place it above `MaterialApp`.
///
/// ```dart
/// await LocaleManager.I.initialize(
///   assetFolderPath: 'assets/translations',
///   enumValues: AppLocale.values,
/// );
/// runApp(
///   LocaleManagerProvider(defaultLocale: AppLocale.en, child: const App()),
/// );
/// ```
class LocaleManagerProvider<T extends Enum> extends StatefulWidget {
  const LocaleManagerProvider({
    required this.defaultLocale,
    required this.child,
    super.key,
    this.fallbackLocale,
    this.controller,
  });

  /// Same as the default constructor (kept for 2.x compatibility).
  const LocaleManagerProvider.create({
    required this.defaultLocale,
    required this.child,
    super.key,
    this.fallbackLocale,
    this.controller,
  });

  /// Initial locale. Ignored when [controller] is given.
  final T defaultLocale;

  /// Locale used when a key is missing. Ignored when [controller] is given.
  final T? fallbackLocale;

  /// External controller. When null, the provider creates and owns one.
  final LocaleController<T>? controller;

  final Widget child;

  /// Controller of the nearest provider; rebuilds on locale change.
  static LocaleController<Enum> of(BuildContext context) {
    final controller = maybeOf(context);
    assert(controller != null, 'No LocaleManagerProvider found in context.');
    return controller!;
  }

  /// Like [of] but returns `null` when there is no provider.
  static LocaleController<Enum>? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_LocaleScope>()?.notifier;

  /// Controller of the nearest provider without registering a dependency.
  /// Use in callbacks such as `onPressed`.
  static LocaleController<Enum> read(BuildContext context) {
    final controller = context
        .getInheritedWidgetOfExactType<_LocaleScope>()
        ?.notifier;
    assert(controller != null, 'No LocaleManagerProvider found in context.');
    return controller!;
  }

  @override
  State<LocaleManagerProvider<T>> createState() =>
      _LocaleManagerProviderState<T>();
}

class _LocaleManagerProviderState<T extends Enum>
    extends State<LocaleManagerProvider<T>> {
  LocaleController<T>? _ownedController;

  LocaleController<T> get _controller =>
      widget.controller ??
      (_ownedController ??= LocaleController<T>(
        defaultLocale: widget.defaultLocale,
        fallbackLocale: widget.fallbackLocale,
      ));

  @override
  void initState() {
    super.initState();
    LocaleManager.I._controller = _controller;
  }

  @override
  void didUpdateWidget(covariant LocaleManagerProvider<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      LocaleManager.I._controller = _controller;
    }
  }

  @override
  void dispose() {
    if (identical(LocaleManager.I._controller, _controller)) {
      LocaleManager.I._controller = null;
    }
    _ownedController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      _LocaleScope(notifier: _controller, child: widget.child);
}

class _LocaleScope extends InheritedNotifier<LocaleController<Enum>> {
  const _LocaleScope({
    required LocaleController<Enum> super.notifier,
    required super.child,
  });
}
