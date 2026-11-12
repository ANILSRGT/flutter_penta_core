import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:penta_core/penta_core.dart';

void main() {
  test('country enum carries dialing data and flag', () {
    const tr = PentaPhoneFieldCountryCodesEnum.turkey;
    expect(tr.isoCode, 'TR');
    expect(tr.dialCode, '+90');
    expect(tr.flag, '🇹🇷');
    expect(tr.countryName('tr'), 'Türkiye');
    expect(tr.countryName('en-US'), isNotEmpty);
    expect(
      PentaPhoneFieldCountryCodesEnum.fromIsoCode('tr'),
      PentaPhoneFieldCountryCodesEnum.turkey,
    );
    expect(
      PhoneList.phoneList().length,
      PentaPhoneFieldCountryCodesEnum.values.length,
    );
  });

  testWidgets('validates length and reports the full number', (tester) async {
    String? valid;
    String? invalid;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PentaPhoneField(
            initialValue: PentaPhoneFieldCountryCodesEnum.turkey,
            callbacks: PentaPhoneFieldCallbacks(
              onValidPhoneNumber: (full, _, _) => valid = full,
              onInvalidPhoneNumber: (_, error) => invalid = error,
            ),
          ),
        ),
      ),
    );

    expect(find.text('+90'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField), '555');
    expect(invalid, isNotNull);
    expect(valid, isNull);

    await tester.enterText(find.byType(TextFormField), '5551234567');
    expect(valid, '+905551234567');
  });

  testWidgets('selects a country from the dialog', (tester) async {
    PentaPhoneFieldCountryCodesEnum? changed;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PentaPhoneField(
            initialValue: PentaPhoneFieldCountryCodesEnum.turkey,
            callbacks: PentaPhoneFieldCallbacks(
              onCountryChanged: (country, _) => changed = country,
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('+90'));
    await tester.pumpAndSettle();
    expect(find.text('Select Country'), findsOneWidget);

    await tester.enterText(find.byType(TextField).last, 'germ');
    await tester.pumpAndSettle();
    await tester.tap(find.text('Germany'));
    await tester.pumpAndSettle();

    expect(changed, PentaPhoneFieldCountryCodesEnum.germany);
    expect(find.text('+49'), findsOneWidget);
  });

  testWidgets('detects the country from the locale', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => Localizations.override(
            context: context,
            locale: const Locale('en', 'DE'),
            child: const Scaffold(body: PentaPhoneField()),
          ),
        ),
      ),
    );
    expect(find.text('+49'), findsOneWidget);
  });
}
