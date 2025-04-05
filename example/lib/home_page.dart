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
