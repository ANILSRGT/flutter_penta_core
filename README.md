# Flutter Penta Core

Flutter Penta Core is a modular and extensible core library for Flutter applications. This library provides various tools, widgets, extensions, and services to speed up the development process and make your code more organized.

## Features

- **Widgets**: Ready-to-use widgets for responsive design, padding management, and more.
- **Extensions**: Useful extensions for classes like String, DateTime, and List.
- **Services**: Services such as router and cache management.
- **Mixins**: Mixins for widget and data management.
- **Managers**: Managers for application-wide features like locale management.
- **Models**: Models for response and error handling.
- **Utilities**: Utility classes for common tasks.
- **Constants**: Constants for easy access to frequently used values.

## Installation

1. Add the following line to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_penta_core: ^1.0.2
```

2. Run the following command to fetch the packages:

```bash
flutter pub get
```

## Locale Management

Follow the steps below to integrate locale management into your application:

```bash
flutter pub run penta_core:lang_generator <input_json_file_path> <output_folder_path> <output_class_name>
```

**Example:**

```bash
flutter pub run penta_core:lang_generator ./assets/lang/en.json ./lib/generated LocaleKeys
```

This command will generate a Dart file in the specified output folder with the provided class name. The generated file will contain all the keys and values from the JSON file.

The names of the enums must match the names of the JSON files. For example, `AppLocale.en` should correspond to `en.json`, or `AppLocale.enUS` should correspond to `enUS.json`.

### Usage:

```dart
- main.dart -

import 'package:example/home_page.dart';
import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';

enum AppLocale { en, tr }

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

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const HomePage());
  }
}
```

```dart
- home_page.dart -

import 'package:example/locale_keys.g.dart';
import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.greeting.translate(context))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                final newLocale =
                    context.localeManagerNotifierRead().currentLocale ==
                            AppLocale.en
                        ? AppLocale.tr
                        : AppLocale.en;
                context.localeManagerNotifierRead().changeLocale(newLocale);
              },
              child: Text(LocaleKeys.changeLanguage.translate(context)),
            ),
            Text(LocaleKeys.testArgs1.translateWithArgs(context, ['Test Arg'])),
          ],
        ),
      ),
    );
  }
}
```

## License

This project is licensed under the MIT License. For more information, see the [LICENSE](LICENSE) file.
