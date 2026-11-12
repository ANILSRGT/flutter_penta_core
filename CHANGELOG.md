# Changelog

## 3.0.0

Full rework of the package. Requires Dart 3.8 / Flutter 3.32.

### Breaking changes and migration

- **Single entry point.** Import only `package:penta_core/penta_core.dart`.
  The `index.dart` barrel files and the `managers/` folder were removed.
- **Extensions** are now zero-cost extension types. Usage through `.ext` is
  unchanged, but the public type names changed (`ContextExtension` +
  `ContextExt`, `StringExtension` + `StringExt`...).
  - `context.ext.seperateGenerator(list, sep)` → `list.ext.separatedBy(sep)` (deprecated alias kept)
  - `list.ext.firstOrNull(test)` → `firstWhereOrNull(test)` (deprecated alias kept)
  - `list.ext.orderWithData(cmp)` → `sorted(cmp)` (deprecated alias kept)
  - `map.ext.removeWhere(test)` → `whereNot(test)` (deprecated alias kept)
  - `formatShort` moved from `int` to `num`.
- **AppValues:** `AppValuesConfig` is now an immutable value class.
  `AppValuesConfig.initialize(md: 14)` → `AppValues.configure(const AppValuesConfig(md: 14))`
  (deprecated alias kept).
- **Localization**
  - `LocaleManager` is no longer generic; the notifier type is the public
    `LocaleController<T>`. `LocaleManager.I.notifier` → `controller`.
  - `LocaleManagerProvider` is now a `StatefulWidget` that owns its controller
    (`LocaleManagerProvider.create` still works). The locale is no longer
    reset when a parent rebuilds.
  - `context.localeManagerNotifierRead` no longer subscribes to changes. Use
    `localeManagerNotifierWatch`, or the `translate*(context)` helpers, in
    `build`.
  - The `<T extends Enum>` type parameter was removed from `translate`, `tr`
    and the related helpers.
  - The generator emits `static const String` fields instead of getters and
    sanitizes keys that are not valid identifiers.
- **WidgetStateMixin:** the state type is public now (`ViewState<S>` with
  `ViewStateIdle/Busy/Success/Fail`). `ViewState.when` is generic.
- **ResponseModel:** the duplicate `fold` extension and
  `ResponseModelExtension` were removed. `castTo` is now a method of
  `ResponseModelFail`.
- **Toast**
  - `PentaToastShowOptions`: `dissmissAll` → `dismissAll`,
    `dissmissable` → `dismissible`, unused `stackCount` removed, new
    `dismissOnTap`. `options` is optional in `show` and `showText`.
  - `PentaToastConfig.customAnimation` receives the animation:
    `(child, animation) => ...`.
  - `PentaToastController.I.dispose()` → `dismissAll()`,
    `dismissAndShowNext()` → `dismiss()` (deprecated aliases kept).
- **Phone field**
  - `PentaPhoneFieldCountryCodesEnum` carries `isoCode`, `dialCode`,
    `minLength`, `maxLength`, `flag`, `countryName()` and `info()`.
  - The unused `PentaPhoneFieldContainerConfig` was removed.
  - A `phoneNumber.customBuilder` result is now wrapped in `Expanded`.
- **Responsive:** breakpoints come from the nearest `PentaResponsiveWrapper`
  (`PentaBreakpoints`). Static breakpoint getters return the defaults.
- **Showcase:** `PentaShowcaseOverlayWrapper` is `const` and keeps its info key
  in its state.
- **Others:** `EmailValidationConstants` → `disposableEmailDomains` (`Set`).
  `PentaDebouncer.debounce` returns `Future<S?> Function(T)`.
  `PentaEventBus.destroy()` returns a `Future`. `IPentaCache` / `IPentaRouter`
  are unchanged.
- The unused `build`, `source_gen`, `path` and `build_runner` dependencies were
  removed.

### Bug fixes

- `Color.ext.toMaterialColor` looped forever and produced wrong shades.
- `String.ext.random*` threw a `RangeError` (`nextInt` limit).
- `validPhoneWithPlus` contained a stray character and rejected valid numbers;
  e-mail validation no longer rejects TLDs longer than 4 letters.
- Duplicate entries in the disposable domain list; the lookup is now O(1).
- `TimestampConverter.convertToDateTimeUTC` returned local time.
- `ImageStringConverter` treated `data:` URIs as files and failed to decode
  them. It now also works on web.
- `LoadingCallbackDialog` left the dialog open when the future threw, could pop
  the wrong route, and showed a cancel button when `cancelable` was false.
- `LocaleManagerProvider.maybeOf` threw when no provider was present.
- `translateWithNamedArgs` replaced only the first occurrence of a placeholder.
- `WidgetStateMixin.executeState` crashed after `dispose`; exceptions are
  now reported as a fail state.
- `PentaResponsiveWrapper` custom breakpoints were silently ignored, and
  `deviceSize` used physical instead of logical pixels.
- `PentaResponsiveWidget` never removed its binding observer.
- The showcase recreated its `GlobalKey` on every build, and the arrow painter
  never cancelled its event bus subscription.
- `PentaUnderlineText` leaked tap recognizers and ignored text scaling and RTL.
- Toast: `boxShadow` and `maxToasts` were ignored, `copyWith` dropped
  `customAnimation`, the animation controller outlived its widget, and showing
  a toast before `PentaToast` was mounted crashed.
- Phone field: changing `languageCode` had no effect, the `dropdown` selection
  type did nothing, `keyboardType` was ignored, and colors were hard-coded
  instead of coming from the theme.
- `FirebaseExceptionConverter` ignored locales without a country code;
  `invalid-credential` is now recognized.

### Added

- `ResponseModel.success/fail/guard`, `dataOrNull`, `errorOrNull`, `map`,
  `then`, equality.
- `ErrorModel.code/error/stackTrace`, `fromException`, `copyWith`.
- Context: `padding`, `viewInsets`, `isKeyboardOpen`, `orientation`,
  `widthPercent`, `navigator`, `messenger`, `unfocus`...
- Extensions: `chunked`, `distinctBy`, `groupBy`, `getOrNull`, `withoutNulls`,
  `getAs`, `remap`, `isBetween`, `capitalized`, `titleCase`, `toIntOrNull`,
  `isDisposableEmail`, `lighten/darken`, `toHex`, `onColor`, `startOfDay`,
  `endOfDay`, `isToday`, `isTomorrow`, `isYesterday`, `DateTimeLabels`,
  `Uint8List.ext.toDataUri`, widget `expanded/flexible/align/onTap/opacity`.
- `AppValues.x.ext.gap`, `sizedBox.square`, start/end directional paddings.
- `PentaResponsiveSizeTypes.parentConstraints`, `PentaBreakpoints`,
  `PentaResponsiveWrapper.value`.
- `LocaleController.fallbackLocale`, `hasKey`, `LocaleManager.loadFromMap`.
- `PentaPhoneFieldStrings` to override texts, `focusNode`, `autovalidateMode`.
- `PentaDebouncer` instance API, `PentaEventBus.on<S>()`.
- Test suite (60 tests).

## 2.1.0
* Fixed localization arguments.
* Added contextless translation methods:
  - tr(): Translate using the globally registered notifier (no BuildContext).
  - trWithArgs(List<String> args): Translate with positional arguments using the globally registered notifier.
  - trWithNamedArgs(Map<String, String> args): Translate with named arguments using the globally registered notifier.

## 2.0.0
* Toast: Toast notification widget for displaying brief messages to users
* Showcase Tutorial Widget: Widget for creating interactive onboarding tutorials and feature highlights
* Extension formats updated: All extensions now use the simplified value.ext.x format instead of value.ext.category.x for easier and more intuitive usage

## 1.1.0
* International Phone Input: Complete phone number input with country selection
* Multi-language Support: Built-in support for 25+ languages
* Country Flag Display: Visual country flags with customizable display options
* Phone Number Validation: Built-in validation with customizable patterns
* Country Code Selection: Dropdown with searchable country list
* Customizable Layout: Flexible layout configuration options
* Callbacks Support: Comprehensive callback system for user interactions
* Text Widgets: Enhanced text widgets with underline support (PentaUnderlineText)
* SizedBox Widgets: Convenient spacing widgets (Gap widget for consistent layouts)
* Field Widgets: Organized field widget structure for better maintainability
* Cache Service: Renamed interface from ICache to IPentaCache for consistency
* Router Service: Renamed interface from IRouter to IPentaRouter for consistency
* Enhanced Utilities: Improved Firebase exception converter and loading dialog
* Updated README: Comprehensive documentation with usage examples
* Improved Constants: Enhanced app values and email validation constants
* Better Organization: Reorganized extension structure and removed unused object extensions
* Locale Manager: Enhanced locale management capabilities
* Fixed interface naming consistency across services
* Improved extension organization and removed deprecated components
* Enhanced locale manager functionality
* Updated pubspec.yaml with improved dependencies
* Enhanced example application with phone field demonstration

## 1.0.2+1
* Fixed version number consistency in pubspec.yaml and CHANGELOG.md

## 1.0.2
* Responsive Layout: PentaResponsiveWidget and PentaAdaptiveWidget for responsive design
* Layout Widgets: Padding, SizedBox, and layout management widgets
* Adaptive Widgets: Platform-specific widget rendering (Android, iOS, Web)
* String Extensions: Validation, conversion, random generation, and formatting
* DateTime Extensions: Formatting, calculation, comparison, and conversion utilities
* List & Map Extensions: Sorting, filtering, manipulation, and search operations
* Context Extensions: Screen information, theme access, and widget context utilities
* Number & Int Extensions: Math operations, formatting, and conversions
* Color Extensions: Material colors and color manipulation
* Widget Extensions: Sliver widgets and widget manipulation
* App Values Extensions: Padding, radius, and SizedBox utilities
* Bool Extensions: Boolean operations and operators
* Iterable Extensions: Iterable manipulation and filtering
* Uint8List Extensions: Binary data conversion utilities
* Object Extensions: Object manipulation and filtering
* Cache Service: Interface for caching operations
* Router Service: Navigation and routing interface
* Connectivity Service: Internet connection checking
* PentaDebouncer: Input debouncing utilities
* PentaEventBus: Application-wide event management
* LoadingCallbackDialog: Callback-based loading dialogs
* FirebaseExceptionConverter: Firebase error message conversion
* ImageStringConverter: Image loading with error handling
* TimestampConverter: Timestamp conversion utilities
* Response Models: Standardized API response handling
* Error Models: Comprehensive error handling and management
* Use Case Models: Clean architecture use case patterns for different scenarios
* Object Models: Base models with ID support
* Material Models: Material design color utilities
* State Mixins: Safe state management for widgets
* Repository Mixins: Data repository patterns for clean architecture
* Widget State Mixins: Widget-specific state management
* Locale Manager: Complete locale management system with provider support
* Locale Manager Extension: Extension methods for locale management
* Locale Manager Notifier: State management for locale changes
* Locale Manager Provider: Provider-based locale management
* App Values: Centralized application constants for consistent spacing
* Email Validation: Email validation constants and patterns
* Language Generator: CLI tool for generating locale keys from JSON files
* Fixed vertical padding calculation in _PaddingAppValuesExt
* Improved timeWhen method to correctly identify 'Today' condition
* Added UTC normalization for date extensions
* Updated README.md for consistency and clarity
* Added comprehensive package description
* Created initial CHANGELOG.md structure
* Added homepage and repository fields to pubspec.yaml
* Updated lang_generator executable path in pubspec.yaml
* Added timeWhen method for improved date formatting

---

## Links

- [GitHub Repository](https://github.com/ANILSRGT/flutter_penta_core)
- [Pub.dev Package](https://pub.dev/packages/penta_core)
- [Documentation](https://github.com/ANILSRGT/flutter_penta_core#readme)