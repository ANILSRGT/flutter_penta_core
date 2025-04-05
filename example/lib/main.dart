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
