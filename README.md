# Flutter Penta Core Package

A comprehensive Flutter package that provides a rich set of utilities, widgets, extensions, and services to accelerate Flutter application development. This package is designed to be modular, extensible, and developer-friendly.

## 📦 Package Information

- **Package Name**: `penta_core`
- **Repository**: [GitHub](https://github.com/ANILSRGT/flutter_penta_core)

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
- **Option 1**:
  - `AppLocale.en` should correspond to `en.json`
  - `AppLocale.tr` should correspond to `tr.json`
- **Option 2**:
  - `AppLocale.enUS` should correspond to `enUS.json`
  - `AppLocale.trTR` should correspond to `trTR.json`

2. **Initialize in main.dart**:
```dart
import 'package:penta_core/penta_core.dart';

// -- Option 1: Using simple locale codes --
enum AppLocale { en, tr }

// -- Option 2: Using full locale codes --
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

## 🚀 Features

### 🎯 **Constants & Values**
- **App Values**: Centralized application constants
- **Email Validation**: Email validation constants

### 🔧 **Extensions**
- **App Values Extensions**: Centralized app constants, padding, radius, and size value management
- **Bool Extensions**: Boolean operations, conditional logic, and type conversions
- **Color Extensions**: Material color utilities, color manipulation, and theme integration
- **Context Extensions**: Screen dimensions, theme access, locale management, and widget context helpers
- **DateTime Extensions**: Formatting, calculation, comparison utilities, and time-based operations
- **Int Extensions**: Mathematical calculations, digit counting, and number formatting
- **Iterable Extensions**: Generic collection operations, filtering, and iteration helpers
- **List Extensions**: Sorting, filtering, manipulation helpers, and collection operations
- **Map Extensions**: Key-value pair manipulation, filtering, and transformation utilities
- **Number Extensions**: Math operations, linear interpolation, and numerical conversions
- **String Extensions**: Validation, conversion, random string generation, and text manipulation utilities
- **Uint8List Extensions**: Byte array conversion, encoding/decoding, and binary data manipulation
- **Widget Extensions**: Sliver widgets, widget manipulation, and UI component utilities

### 🌍 **Managers**
- **Locale Management**: Complete locale management system with easy switching

### 📱 **Models & Mixins**
- **Response Models**: Standardized API response handling and data structure management
- **Error Models**: Error handling, management, and error state representation
- **Use Case Models**: Clean architecture use case patterns with various parameter and response combinations
- **Object Models**: Base model classes with ID support and common object operations
- **Material Models**: Material Design color and theme model implementations
- **State Mixins**: Safe state management for widgets with lifecycle handling
- **Repository Mixins**: Data repository patterns and data access layer abstractions

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

### 🎨 **Widgets**
- **Field Widgets**: International phone number input with country selection, supporting 25+ languages with customizable UI, validation, and country code detection
- **Layout Widgets**: Adaptive and responsive design widgets that automatically adjust to different screen sizes and platforms (mobile, desktop, web), plus padding management utilities
- **Overlay Widgets**: Showcase widgets for user onboarding, feature highlighting, and interactive overlays
- **Padding Widgets**: Smart padding management with selective padding application and escape mechanism for specific widgets
- **Painter Widgets**: Custom drawing widgets including arrow painters for connecting UI elements with arrows  
- **SizedBox Widgets**: Gap widgets for flexible spacing and layout management with customizable dimensions and colors
- **Text Widgets**: Enhanced text widgets with customizable underline support, clickable text spans, and rich text formatting
- **Toast Widgets**: Toast notifications with customizable positioning, animations, and styling for user feedback

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

## 🌍 Supported Languages (Phone Field)

The phone field widget supports 25+ languages:
- Arabic (ar), Bengali (bn), Chinese (zh)
- Dutch (nl), English (en), French (fr)
- German (de), Greek (el), Hindi (hi)
- Indonesian (id), Italian (it), Japanese (ja)
- Korean (ko), Persian (fa), Polish (pl)
- Portuguese (pt), Russian (ru), Spanish (es)
- Swedish (sv), Thai (th), Turkish (tr)
- Ukrainian (uk), Urdu (ur), Vietnamese (vi)

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