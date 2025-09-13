import 'package:example/localization_example_page.dart';
import 'package:example/phone_field_example_page.dart';
import 'package:example/toast_example_page.dart';
import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocaleManager.I.initialize(
    assetFolderPath: 'assets/translations',
    enumValues: AppLocale.values,
  );

  runApp(
    LocaleManagerProvider.create(defaultLocale: AppLocale.en, child: _MyApp()),
  );
}

class _MyApp extends StatelessWidget {
  _MyApp();

  final _pages = [
    (ToastExamplePage(), 'Toast Example'),
    (PhoneFieldExamplePage(), 'Phone Field Example'),
    (LocalizationExamplePage(), 'Localization Example'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      builder: (_, child) {
        return PentaToast(
          config: PentaToastConfig(
            backgroundColor: Colors.black.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(10),
            padding: EdgeInsets.all(10),
            animationDuration: Duration(milliseconds: 300),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.5),
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
            position: PentaToastPosition.bottomCenter,
            duration: Duration(seconds: 3),
            maxToasts: 2,
          ),
          child: child!,
        );
      },
      home: Builder(
        builder: (context) {
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      _pages
                          .map(
                            (page) => ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) => page.$1),
                                );
                              },
                              child: Text(page.$2),
                            ),
                          )
                          .toList(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
