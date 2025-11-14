import 'package:example/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';

enum AppLocale { en, tr }

class LocalizationExamplePage extends StatelessWidget {
  const LocalizationExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.greeting.tr())),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                final newLocale =
                    context.localeManagerNotifierRead.currentLocale ==
                            AppLocale.en
                        ? AppLocale.tr
                        : AppLocale.en;
                context.localeManagerNotifierRead.changeLocale(newLocale);
              },
              child: Text(LocaleKeys.changeLanguage.tr()),
            ),
            Text(LocaleKeys.testArgs1.trWithArgs(['ARG 1'])),
            Text(LocaleKeys.testMultiArgs2.trWithArgs(['ARG 1', 'ARG 2'])),
            Text(
              LocaleKeys.testNamedArgs2.trWithNamedArgs({
                'name': 'John',
                'age': '20',
              }),
            ),
          ],
        ),
      ),
    );
  }
}
