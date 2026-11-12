import 'package:example/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';

enum AppLocale { en, tr }

class LocalizationExamplePage extends StatelessWidget {
  const LocalizationExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // translate(context) rebuilds this page when the locale changes.
      appBar: AppBar(title: Text(LocaleKeys.greeting.translate(context))),
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
              child: Text(LocaleKeys.changeLanguage.translate(context)),
            ),
            Text(LocaleKeys.testArgs1.translateWithArgs(context, ['ARG 1'])),
            Text(
              LocaleKeys.testMultiArgs2.translateWithArgs(context, [
                'ARG 1',
                'ARG 2',
              ]),
            ),
            Text(
              LocaleKeys.testNamedArgs2.translateWithNamedArgs(context, {
                'name': 'John',
                'age': 20,
              }),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              // Context-less tr() is handy outside widgets (services, toasts).
              onPressed: () => PentaToastController.I.showText(
                text: LocaleKeys.greeting.tr(),
              ),
              child: const Text('tr() in a toast'),
            ),
          ],
        ),
      ),
    );
  }
}
