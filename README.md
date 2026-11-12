# penta_core

Core toolkit for Flutter apps: namespaced extensions, spacing tokens, result
models, use case contracts, JSON localization, toast, showcase, responsive
layout and an international phone field.

- Repository: [github.com/ANILSRGT/flutter_penta_core](https://github.com/ANILSRGT/flutter_penta_core)
- Migrating from 2.x: see [CHANGELOG.md](CHANGELOG.md#300)

```yaml
dependencies:
  penta_core: ^3.0.0
```

```dart
import 'package:penta_core/penta_core.dart';
```

## Extensions

Every extension lives under `.ext`, so it never clashes with other packages
that add `context.theme` or `string.isEmail`. They are Dart extension types:
calling `.ext` allocates nothing.

```dart
// BuildContext
context.ext.width;                 // MediaQuery.sizeOf, granular rebuilds
context.ext.colorScheme.primary;
context.ext.isKeyboardOpen;
context.ext.byOrientation(portrait: 1, landscape: 2);
context.ext.unfocus();

// AppValues spacing tokens (xxs 2 … xl6 40, configurable)
Padding(padding: AppValues.md.ext.padding.all);
AppValues.lg.ext.gap;                          // Gap(16)
AppValues.sm.ext.radius.border.directional.top;

// String (nullable receiver)
'mail@acme.com'.ext.validEmail;   // syntax + not a disposable domain
'+90 555 123 45 67'.ext.validPhoneWithPlus;
nullableText.ext.isNullOrBlank;
'hello world'.ext.titleCase;      // Hello World
'data:image/png;base64,...'.ext.toUint8List;

// Numbers / DateTime
1530000.ext.formatShort();        // 1.5M
date.ext.plus(month: 1);
date.ext.isToday;
date.ext.timeAgo(labels: const DateTimeLabels.tr());
date.ext.format(format: 'd MMMM y');

// Collections
[a, b, c].ext.separatedBy(const Divider());
users.ext.firstWhereOrNull((u) => u.isAdmin);
items.ext.chunked(3);
list.ext.sorted((a, b) => a.compareTo(b));     // copy, original untouched
map.ext.withoutNulls;

// Widget / Color
const Text('Hi').ext.allPadding(AppValues.md);
child.ext.toBoxAdapter;
color.ext.toMaterialColor;
color.ext.darken(.2);
```

Configure the spacing scale once:

```dart
AppValues.configure(const AppValuesConfig(md: 14, lg: 18));
```

## Localization

1. Put one JSON file per locale in your assets. File names must match the enum
   values (`en.json` → `AppLocale.en`, `enUS.json` → `AppLocale.enUS`). Nested
   objects become dotted keys (`home.title`).

2. Generate key constants:

   ```bash
   dart run penta_core:lang_generator assets/translations/en.json lib/generated LocaleKeys
   ```

   `{"home": {"title": "Hi {}"}}` becomes
   `static const String homeTitleArgs1 = 'home.title';`.

3. Load and provide:

   ```dart
   enum AppLocale { en, tr }

   Future<void> main() async {
     WidgetsFlutterBinding.ensureInitialized();
     await LocaleManager.I.initialize(
       assetFolderPath: 'assets/translations',
       enumValues: AppLocale.values,
     );
     runApp(
       LocaleManagerProvider(
         defaultLocale: AppLocale.en,
         fallbackLocale: AppLocale.en, // used for missing keys
         child: const App(),
       ),
     );
   }
   ```

4. Translate:

   ```dart
   // Rebuilds the widget when the locale changes
   Text(LocaleKeys.greeting.translate(context));
   Text(LocaleKeys.testArgs1.translateWithArgs(context, ['Ada']));      // "Hi {}"
   Text(LocaleKeys.welcome.translateWithNamedArgs(context, {'name': 'Ada'}));

   // Change locale from a callback (does not subscribe)
   context.localeManagerNotifierRead.changeLocale(AppLocale.tr);

   // Without a BuildContext (services, toasts). Does not rebuild by itself.
   LocaleKeys.greeting.tr();
   ```

## Results and use cases

```dart
Future<ResponseModel<User>> fetchUser() => ResponseModel.guard(
  () => api.getUser(),
  onError: (e, st) => ErrorModel(message: 'Could not load user', error: e),
);

final response = await fetchUser();
switch (response) {
  case ResponseModelSuccess(:final data):
    print(data.name);
  case ResponseModelFail(:final error):
    print(error.message);
}

response.dataOrNull;
response.map((user) => user.name);
response.when(onSuccess: (u) => u.name, onFail: (f) => f.error.message);
```

Use case contracts follow the pattern
`IUseCase[Stream|NoFuture][NoResponse][WithParams]`:

```dart
final class GetUser implements IUseCaseWithParams<User, String> {
  @override
  Future<ResponseModel<User>> execute(String id) => repository.getUser(id);
}
```

## Widget state

```dart
class _ProfileState extends State<Profile>
    with WidgetStateMixin<Profile, User> {
  @override
  void initState() {
    super.initState();
    executeState(callback: () => getUser.execute(widget.id));
  }

  @override
  Widget build(BuildContext context) => buildState(
    idle: SizedBox.new,
    busy: () => const CircularProgressIndicator(),
    success: (user) => Text(user.name),
    fail: (error) => Text(error.message),
  );
}
```

Exceptions become `ViewStateFail`, and results that arrive after `dispose` or
after a newer `executeState` call are ignored. `SafeStateMixin` adds
`setStateSafe` and `runMounted`.

## Toast

```dart
MaterialApp(
  builder: (context, child) => PentaToast(
    config: const PentaToastConfig(position: PentaToastPosition.topCenter),
    child: child,
  ),
);

PentaToastController.I.showText(text: 'Saved');
PentaToastController.I.show(
  content: const Row(children: [Icon(Icons.check), Text('Done')]),
  options: const PentaToastShowOptions(dismissAll: true, dismissOnTap: true),
);
```

Toasts are queued and shown one at a time. They can be swiped away, and
`maxToasts` limits the queue.

## Phone field

```dart
PentaPhoneField(
  languageCode: 'tr',                       // 24 languages built in
  initialValue: PentaPhoneFieldCountryCodesEnum.turkey,
  selection: const PentaPhoneFieldCountrySelectionConfig(
    selectionType: PentaPhoneFieldSelectionType.bottomSheet, // dialog | dropdown
  ),
  callbacks: PentaPhoneFieldCallbacks(
    onValidPhoneNumber: (full, country, info) => print(full), // +905551234567
  ),
);
```

Every country has `isoCode`, `dialCode`, `flag`, `minLength`, `maxLength` and
`countryName(languageCode)`. Without `initialValue`, the country comes from the
app locale. The length check also runs as the `TextFormField` validator, so it
works with `Form.validate()`. You can supply your own texts with `strings:`.

Supported languages: ar, bn, de, el, en, es, fa, fr, hi, id, it, ja, ko, nl, pl,
pt, ru, sv, th, tr, uk, ur, vi, zh.

## Layout

```dart
// Responsive: normal < sm(640) < md(768) < lg(1024) < xl(1280) < xxl(1536)
PentaResponsiveWidget(normal: MobileView(), lg: DesktopView());
PentaResponsiveWidget(
  sizeType: PentaResponsiveSizeTypes.parentConstraints, // uses LayoutBuilder
  normal: OneColumn(),
  md: TwoColumns(),
);
final columns = PentaResponsiveWrapper.value(context, normal: 1, md: 2, xl: 4);

// Custom breakpoints for a subtree
PentaResponsiveWrapper(
  breakPoints: const {PentaResponsiveResolutions.md: 700},
  child: app,
);

// Per platform
PentaAdaptiveWidget.compact(
  defaultWidget: MaterialButton(),
  mobile: CupertinoButton(),
);

// Gap follows the parent Flex axis
Column(children: [header, const Gap(16), body]);
```

## Showcase

```dart
PentaShowcaseOverlayWrapper(
  showcaseOpen: open,
  layerLink: link,
  showcaseKey: key,
  infoAlign: Alignment.center,
  infoChild: const Text('Tap here to start'),
  onBarrierTap: () => setState(() => open = false),
  child: Scaffold(
    body: PentaShowcase(
      showcaseOpen: open,
      layerLink: link,
      showcaseKey: key,
      widget: button,
      showcaseWidget: button,
    ),
  ),
);
```

`PentaDrawArrowConfig` controls the arrow (solid/dotted, gradient, curve, head
size, gap). Fire the `updateEventBus` to re-measure after scrolling.

## Utilities

| API | Purpose |
|-----|---------|
| `LoadingCallbackDialog.showLoadingDialog` | Runs a future behind a loading dialog. The dialog always closes, even on errors; only that dialog is removed; it can be cancelled. |
| `PentaDebouncer` | `PentaDebouncer(duration).run(action)`, or `PentaDebouncer.debounce(...)` to wrap a function. |
| `PentaEventBus<T>` | Publish / subscribe, with `on<SubType>()` filtering. |
| `ConnectivityService` | `isConnected`, `connectionStream`. `debugOverride` for tests. |
| `DataRepoMixin` | `executeByDatasource(local:, remote:)` by connectivity. |
| `FirebaseExceptionConverter.getMessage(code, locale:)` | Localized Firebase Auth errors (18 locales, language fallback). |
| `ImageStringConverter.toImageProvider` | URL, `data:` URI, asset or file path to `ImageProvider` (web safe). |
| `TimestampConverter` | Epoch milliseconds to and from local or UTC `DateTime`. |
| `PentaUnderlineText` | Rich text with per-span underline offset, color and thickness. |
| `RemovePaddingList` | Pads every child except those marked with `.toRemovePaddingIgnore`. |
| `IPentaCache`, `IPentaRouter` | Contracts for cache and enum-based router implementations. |

## License

MIT. See [LICENSE](LICENSE).
