import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:penta_core/penta_core.dart';

enum _Locale { en, tr }

void main() {
  setUp(() {
    LocaleManager.I
      ..reset()
      ..loadFromMap(_Locale.en, {
        'hello': 'Hello',
        'onlyEn': 'Only English',
        'greet': 'Hi {} and {}',
        'named': 'Hi {name}, {name}! Age {age}',
        'home': {'title': 'Home'},
      })
      ..loadFromMap(_Locale.tr, {
        'hello': 'Merhaba',
        'greet': 'Selam {} ve {}',
      });
  });

  test('controller translates, flattens and fills placeholders', () {
    final controller = LocaleController<_Locale>(
      defaultLocale: _Locale.en,
      fallbackLocale: _Locale.en,
    );

    expect(controller.translate('hello'), 'Hello');
    expect(controller.translate('home.title'), 'Home');
    expect(controller.translate('missing'), 'missing');
    expect(controller.translateWithArgs('greet', ['A', 'B']), 'Hi A and B');
    expect(controller.translateWithArgs('greet', ['A']), 'Hi A and {}');
    expect(
      controller.translateWithNamedArgs('named', {'name': 'Ada', 'age': 3}),
      'Hi Ada, Ada! Age 3',
    );

    controller.changeLocale(_Locale.tr);
    expect(controller.translate('hello'), 'Merhaba');
    expect(controller.translate('onlyEn'), 'Only English');
  });

  testWidgets('provider rebuilds dependents and registers controller', (
    tester,
  ) async {
    await tester.pumpWidget(
      LocaleManagerProvider<_Locale>(
        defaultLocale: _Locale.en,
        child: MaterialApp(
          home: Builder(
            builder: (context) => Column(
              children: [
                Text('hello'.translate(context)),
                ElevatedButton(
                  onPressed: () => context.localeManagerNotifierRead
                      .changeLocale(_Locale.tr),
                  child: const Text('switch'),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    expect(find.text('Hello'), findsOneWidget);
    expect('hello'.tr(), 'Hello');

    await tester.tap(find.text('switch'));
    await tester.pump();

    expect(find.text('Merhaba'), findsOneWidget);
    expect('hello'.tr(), 'Merhaba');
  });

  testWidgets('controller survives parent rebuilds', (tester) async {
    late StateSetter rebuild;
    await tester.pumpWidget(
      StatefulBuilder(
        builder: (context, setState) {
          rebuild = setState;
          return LocaleManagerProvider<_Locale>(
            defaultLocale: _Locale.en,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Builder(
                builder: (context) => Text('hello'.translate(context)),
              ),
            ),
          );
        },
      ),
    );

    LocaleManager.I.controller!.changeLocale(_Locale.tr);
    await tester.pump();
    rebuild(() {});
    await tester.pump();

    expect(find.text('Merhaba'), findsOneWidget);
  });

  test('tr() returns the key without a provider', () {
    expect('hello'.tr(), 'hello');
  });
}
