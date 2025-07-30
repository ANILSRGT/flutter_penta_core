# Flutter Penta Core Package

A comprehensive Flutter package that provides a rich set of utilities, widgets, extensions, and services to accelerate Flutter application development. This package is designed to be modular, extensible, and developer-friendly.

## 📦 Package Information

- **Package Name**: `penta_core`
- **Version**: 1.0.3
- **SDK Requirements**: Flutter >=1.17.0, Dart ^3.7.0
- **Repository**: [GitHub](https://github.com/ANILSRGT/flutter_penta_core)

## 🚀 Features

### 🌍 **Internationalization & Localization**
- **Locale Management**: Complete locale management system with easy switching
- **Language Generator**: CLI tool for generating locale keys from JSON files
- **Multi-language Support**: Built-in support for 25+ languages in phone field widget

### 🎨 **Widgets**
- **Phone Field**: International phone number input with country selection
- **Responsive Layout**: Adaptive and responsive design widgets
- **Text Widgets**: Enhanced text widgets with underline support
- **Layout Widgets**: Padding, SizedBox, and layout management widgets

### 🔧 **Extensions**
- **String Extensions**: Validation, conversion, and random string generation
- **DateTime Extensions**: Formatting, calculation, and comparison utilities
- **List & Map Extensions**: Sorting, filtering, and manipulation helpers
- **Color Extensions**: Material color and color manipulation utilities
- **Context Extensions**: Screen, theme, and widget context helpers
- **Number Extensions**: Math operations and conversions
- **Widget Extensions**: Sliver and widget manipulation utilities

### 🛠 **Services & Utilities**
- **Cache Service**: Interface for caching operations
- **Router Service**: Navigation and routing interface
- **Connectivity Service**: Internet connection checking
- **Event Bus**: Application-wide event management
- **Debouncer**: Input debouncing utilities
- **Loading Dialog**: Callback-based loading dialogs

### 📱 **Models & Mixins**
- **Response Models**: Standardized API response handling
- **Error Models**: Error handling and management
- **Use Case Models**: Clean architecture use case patterns
- **State Mixins**: Safe state management for widgets
- **Repository Mixins**: Data repository patterns

### 🎯 **Constants & Values**
- **App Values**: Centralized application constants
- **Email Validation**: Email validation constants
- **Padding & Radius**: Consistent spacing values

## 📥 Installation

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  penta_core: ^1.0.3
```

Then run:
```bash
flutter pub get
```

## 🔧 Setup

### Locale Management Setup

1. **Generate Locale Keys**:
```bash
flutter pub run penta_core:lang_generator <input_json_file_path> <output_folder_path> <output_class_name>
```

**Example**:
```bash
flutter pub run penta_core:lang_generator ./assets/lang/en.json ./lib/generated LocaleKeys
```

**Important**: The enum names must match the JSON file names exactly. For example:
- `AppLocale.en` should correspond to `en.json`
- `AppLocale.tr` should correspond to `tr.json`
- `AppLocale.enUS` should correspond to `enUS.json`
- `AppLocale.trTR` should correspond to `trTR.json`

2. **Initialize in main.dart**:
```dart
import 'package:penta_core/penta_core.dart';

// Option 1: Using simple locale codes
enum AppLocale { en, tr }

// Option 2: Using full locale codes
// enum AppLocale { enUS, trTR }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocaleManager.I.initialize(
    assetFolderPath: 'assets/translations',
    enumValues: AppLocale.values,
  );

  runApp(
    LocaleManagerProvider.create(
      defaultLocale: AppLocale.en,
      child: const MainApp(),
    ),
  );
}
```

## 📖 Usage Examples

### Phone Field Widget

```dart
import 'package:penta_core/penta_core.dart';

PentaPhoneField(
  onChanged: (phoneInfo) {
    print('Phone: ${phoneInfo.phoneNumber}');
    print('Country: ${phoneInfo.countryName}');
    print('Code: ${phoneInfo.countryCode}');
  },
  configs: PentaPhoneFieldConfigs(
    initialCountry: PentaPhoneFieldCountryCodes.turkey,
    showCountryFlag: true,
    showCountryName: true,
  ),
)
```

### String Extensions

```dart
// Validation
bool isValidEmail = "test@example.com".ext.validation.validEmail;
bool isValidPhone = "+1234567890".ext.validation.validPhoneWithPlus;

// Random string generation
String random = "".ext.random.generateRandomString(10);

// Conversion to Uint8List
Uint8List bytes = "base64String".ext.convert.toUint8List;

### Int Extensions

```dart
// Calculation
int digitCount = 12345.ext.calc.digitsCount; // 5

// Formatting
String formatted = 1000000.ext.converter.formatShort(); // "1M"
String formattedTR = 1000000.ext.converter.formatShort(locale: Locale('tr', 'TR')); // "1Mn"

### Number Extensions

```dart
// Linear interpolation
double interpolated = 10.ext.math.lerp(20, 0.5); // 15.0
```

### DateTime Extensions

```dart
// Formatting
String formatted = DateTime.now().ext.converter.format(format: 'yyyy-MM-dd');
String timeAgo = DateTime.now().ext.converter.timeAgo;

// Comparison
bool isSameDay = someDate.ext.compare.isSameDay(DateTime.now());
bool isSameMonth = someDate.ext.compare.isSameMonth(DateTime.now());
bool isSameYear = someDate.ext.compare.isSameYear(DateTime.now());

// Calculation
DateTime nextWeek = DateTime.now().ext.calc.plus(day: 7);
DateTime lastMonth = DateTime.now().ext.calc.minus(month: 1);
```

### List Extensions

```dart
// Sorting with custom comparator
List<int> sorted = [3, 1, 2].ext.sorter.orderWithData((a, b) => a.compareTo(b));

// Finding first element that matches condition
int? firstEven = [1, 2, 3, 4].ext.where.firstOrNull((element) => element % 2 == 0);
String? firstNonEmpty = ['', 'a', '', 'b'].ext.where.firstOrNull((element) => element.isNotEmpty);
```

### Context Extensions

```dart
// Screen information
double screenWidth = context.ext.screen.width;
double screenHeight = context.ext.screen.height;
Size screenSize = context.ext.screen.size;

// Orientation-based values
Widget orientationWidget = context.ext.screen.byOrientation(
  portrait: Text('Portrait'),
  landscape: Text('Landscape'),
);

// Theme access
ThemeData theme = context.ext.theme.theme;
ColorScheme colorScheme = context.ext.theme.colorScheme;
bool isDark = context.ext.theme.isDark;
bool isLight = context.ext.theme.isLight;

// Brightness-based values
Color backgroundColor = context.ext.theme.convertByBrightness(
  light: Colors.white,
  dark: Colors.black,
);

// Locale management
context.localeManagerNotifierRead.changeLocale(AppLocale.tr);
String translated = LocaleKeys.hello.translate(context);
```

### Responsive Widgets

```dart
PentaResponsiveWidget(
  mobile: Container(color: Colors.blue),
  tablet: Container(color: Colors.green),
  desktop: Container(color: Colors.red),
)

PentaAdaptiveWidget(
  android: AndroidWidget(),
  ios: IOSWidget(),
  web: WebWidget(),
)
```

### Utilities

```dart
// Debouncer
final debouncedSearch = PentaDebouncer.debounce<String, String>(
  debounceDuration: Duration(milliseconds: 500),
  function: (searchTerm) async {
    return await performSearch(searchTerm);
  },
);

// Usage
await debouncedSearch('search term');

// Event Bus
final eventBus = PentaEventBus<String>();

// Listen to events
eventBus.on.listen((event) {
  print('Received event: $event');
});

// Fire events
eventBus.fire('user_logged_in');

// Don't forget to destroy when done
eventBus.destroy();

// Connectivity
bool isConnected = await ConnectivityService.isConnected;
Stream<bool> connectionStream = ConnectivityService.connectionStream;

// Loading Dialog
await LoadingCallbackDialog.showLoadingDialog(
  context: context,
  future: () async => await someAsyncOperation(),
  callback: (result) async {
    // Handle the result
    print('Operation completed: $result');
  },
);

// Firebase Exception Converter
String errorMessage = FirebaseExceptionConverter.getMessage(
  'email-already-in-use',
  locale: Locale('tr', 'TR'),
);

// Image String Converter
Widget imageWidget = ImageStringConverter.imageProviderBuilder(
  image: 'https://example.com/image.jpg',
  onError: Icon(Icons.error),
  builder: (imageProvider) => Image(image: imageProvider),
);

// Timestamp Converter
DateTime localTime = TimestampConverter.convertToDateTimeLocal(1640995200000);
DateTime utcTime = TimestampConverter.convertToDateTimeUTC(1640995200000);
int timestamp = TimestampConverter.convertToTimestamp(DateTime.now());
```

## 🏗 Architecture

The package follows a modular architecture with clear separation of concerns:

```
lib/src/
├── constants/     # Application constants and values
├── extensions/    # Dart class extensions
├── managers/      # Application-wide managers
├── mixins/        # Reusable mixins
├── models/        # Data models and interfaces
├── services/      # Service interfaces
├── utils/         # Utility classes
└── widgets/       # Reusable widgets
```

## 🌍 Supported Languages

The phone field widget supports 25+ languages:
- Arabic (ar), Bengali (bn), Chinese (zh)
- Dutch (nl), English (en), French (fr)
- German (de), Greek (el), Hindi (hi)
- Indonesian (id), Italian (it), Japanese (ja)
- Korean (ko), Persian (fa), Polish (pl)
- Portuguese (pt), Russian (ru), Spanish (es)
- Swedish (sv), Thai (th), Turkish (tr)
- Ukrainian (uk), Urdu (ur), Vietnamese (vi)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## 🔗 Links

- [GitHub Repository](https://github.com/ANILSRGT/flutter_penta_core)
- [Pub.dev Package](https://pub.dev/packages/penta_core)
- [Documentation](https://github.com/ANILSRGT/flutter_penta_core#readme)

## 📞 Support

If you encounter any issues or have questions, please:
1. Check the [GitHub Issues](https://github.com/ANILSRGT/flutter_penta_core/issues)
2. Create a new issue with detailed information
3. Contact the maintainer

---

**Made with ❤️ for the Flutter community** 