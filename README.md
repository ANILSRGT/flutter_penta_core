# Flutter Penta Core Package

A comprehensive Flutter package that provides a rich set of utilities, widgets, extensions, and services to accelerate Flutter application development. This package is designed to be modular, extensible, and developer-friendly.

## 📦 Package Information

- **Package Name**: `penta_core`
- **Version**: 1.2.0
- **Repository**: [GitHub](https://github.com/ANILSRGT/flutter_penta_core)

## 🚀 Features

### 🌍 **Internationalization & Localization**
- **Locale Management**: Complete locale management system with easy switching
- **Language Generator**: CLI tool for generating locale keys from JSON files
- **Multi-language Support**: Built-in support for 25+ languages in phone field widget

### 🎨 **Widgets**
- **Field Widgets**: International phone number input with country selection, supporting 25+ languages with customizable UI, validation, and country code detection
- **Layout Widgets**: Adaptive and responsive design widgets that automatically adjust to different screen sizes and platforms (mobile, desktop, web), plus padding management utilities
- **Text Widgets**: Enhanced text widgets with customizable underline support, clickable text spans, and rich text formatting
- **SizedBox Widgets**: Gap widgets for flexible spacing and layout management with customizable dimensions and colors
- **Toast Widgets**: Toast notifications with customizable positioning, animations, and styling for user feedback
- **Overlay Widgets**: Showcase widgets for user onboarding, feature highlighting, and interactive overlays
- **Painter Widgets**: Custom drawing widgets including arrow painters for connecting UI elements with arrows  

### 🔧 **Extensions**
- **String Extensions**: Validation, conversion, random string generation, and text manipulation utilities
- **DateTime Extensions**: Formatting, calculation, comparison utilities, and time-based operations
- **List Extensions**: Sorting, filtering, manipulation helpers, and collection operations
- **Map Extensions**: Key-value pair manipulation, filtering, and transformation utilities
- **Iterable Extensions**: Generic collection operations, filtering, and iteration helpers
- **Int Extensions**: Mathematical calculations, digit counting, and number formatting
- **Number Extensions**: Math operations, linear interpolation, and numerical conversions
- **Bool Extensions**: Boolean operations, conditional logic, and type conversions
- **Color Extensions**: Material color utilities, color manipulation, and theme integration
- **Context Extensions**: Screen dimensions, theme access, locale management, and widget context helpers
- **Widget Extensions**: Sliver widgets, widget manipulation, and UI component utilities
- **Uint8List Extensions**: Byte array conversion, encoding/decoding, and binary data manipulation
- **App Values Extensions**: Centralized app constants, padding, radius, and size value management

### 🛠 **Services & Utilities**
- **Cache Service**: Interface for caching operations and data persistence
- **Router Service**: Navigation and routing interface for app navigation
- **Connectivity Service**: Internet connection checking and network status monitoring
- **Event Bus**: Application-wide event management and communication system
- **Debouncer**: Input debouncing utilities for search, API calls, and user interactions
- **Loading Dialog**: Callback-based loading dialogs with async operation handling
- **Firebase Exception Converter**: Multi-language Firebase error message conversion and localization
- **Image String Converter**: Universal image provider creation from URLs, assets, files, and base64 data
- **Timestamp Converter**: DateTime and timestamp conversion utilities for local and UTC time handling

### 📱 **Models & Mixins**
- **Response Models**: Standardized API response handling and data structure management
- **Error Models**: Error handling, management, and error state representation
- **Use Case Models**: Clean architecture use case patterns with various parameter and response combinations
- **Object Models**: Base model classes with ID support and common object operations
- **Material Models**: Material Design color and theme model implementations
- **State Mixins**: Safe state management for widgets with lifecycle handling
- **Repository Mixins**: Data repository patterns and data access layer abstractions

### 🎯 **Constants & Values**
- **App Values**: Centralized application constants
- **Email Validation**: Email validation constants

## 📥 Installation

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  penta_core: ^1.2.0
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