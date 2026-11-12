import 'package:example/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:penta_core/penta_core.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  Future<void> shot(String name) async {
    await binding.takeScreenshot(name);
  }

  Future<void> open(WidgetTester tester, String page) async {
    await tester.tap(find.text(page));
    await tester.pumpAndSettle();
  }

  Future<void> back(WidgetTester tester) async {
    await tester.pageBack();
    await tester.pumpAndSettle();
  }

  /// Pumps frames for [ms] so timers and animations both progress.
  Future<void> wait(WidgetTester tester, int ms) async {
    for (var t = 0; t < ms; t += 50) {
      await tester.pump(const Duration(milliseconds: 50));
    }
  }

  testWidgets('example app end to end', (tester) async {
    await app.main();
    await tester.pumpAndSettle();
    expect(find.text('Toast Example'), findsOneWidget);
    await shot('01_home');

    // ------------------------------------------------------------ toast
    await open(tester, 'Toast Example');
    await tester.tap(find.text('Queue a toast'));
    await tester.tap(find.text('Queue a toast'));
    await wait(tester, 500);
    expect(find.textContaining('Hello, world!'), findsOneWidget);
    await shot('02_toast_bottom');

    // dismissAll + custom position
    await tester.tap(find.text('topCenter'));
    await wait(tester, 500);
    expect(find.text('topCenter'), findsNWidgets(2));
    expect(find.textContaining('Hello, world!'), findsNothing);
    await shot('03_toast_top');

    await tester.tap(find.text('Dismiss all'));
    await wait(tester, 800);
    expect(find.text('topCenter'), findsOneWidget);
    await back(tester);

    // ------------------------------------------------------- phone field
    await open(tester, 'Phone Field Example');
    Finder field(int i) => find.byType(PentaPhoneField).at(i);
    Finder inField(int i, Finder finder) =>
        find.descendant(of: field(i), matching: finder);
    Finder selector(int i) => inField(i, find.byType(InkWell)).first;

    expect(inField(0, find.text('+90')), findsOneWidget);
    final firstInput = inField(0, find.byType(TextFormField));

    await tester.enterText(firstInput, '555');
    await tester.pumpAndSettle();
    expect(
      find.text('Telefon numarası 10 ile 10 haneli olmalıdır'),
      findsWidgets,
    );

    await tester.enterText(firstInput, '5551234567');
    await tester.pumpAndSettle();
    expect(find.text('Valid: +905551234567'), findsOneWidget);
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle();
    await shot('04_phone_valid');

    // dialog with Turkish names + search
    await tester.tap(selector(0));
    await tester.pumpAndSettle();
    expect(find.text('Ülke Seçin'), findsOneWidget);
    await tester.enterText(find.byType(TextField).last, 'alma');
    await tester.pumpAndSettle();
    await shot('05_phone_dialog_search');
    await tester.tap(find.text('Almanya'));
    await tester.pumpAndSettle();
    expect(inField(0, find.text('+49')), findsOneWidget);
    // 10 digits is too short for nothing: Germany allows 10-13, still valid
    expect(find.text('Valid: +495551234567'), findsOneWidget);

    // bottom sheet (second field, flag only)
    await tester.tap(selector(1));
    await tester.pumpAndSettle();
    expect(find.text('Select country'), findsOneWidget);
    await shot('06_phone_bottom_sheet');
    await tester.enterText(find.byType(TextField).last, 'turk');
    await tester.pumpAndSettle();
    await tester.tap(find.text('Turkey'));
    await tester.pumpAndSettle();
    expect(
      inField(1, find.text(PentaPhoneFieldCountryCodesEnum.turkey.flag)),
      findsOneWidget,
    );

    // dropdown (third field)
    await tester.tap(selector(2));
    await tester.pumpAndSettle();
    expect(
      find.byType(PopupMenuItem<PentaPhoneFieldCountryCodesEnum>),
      findsWidgets,
    );
    await Future<void>.delayed(const Duration(seconds: 1));
    await tester.pumpAndSettle();
    await shot('07_phone_dropdown');
    final item = find
        .byType(PopupMenuItem<PentaPhoneFieldCountryCodesEnum>)
        .hitTestable()
        .first;
    final picked = tester
        .widget<PopupMenuItem<PentaPhoneFieldCountryCodesEnum>>(item)
        .value!;
    await tester.tap(item);
    await tester.pumpAndSettle();
    expect(inField(2, find.textContaining(picked.dialCode)), findsWidgets);
    await shot('07b_phone_after_dropdown');
    await back(tester);

    // ------------------------------------------------------ localization
    await open(tester, 'Localization Example');
    expect(find.text('Hello'), findsOneWidget);
    expect(find.text('test ARG 1 and ARG 2'), findsOneWidget);
    expect(find.text('test John and 20'), findsOneWidget);
    await shot('08_locale_en');

    await tester.tap(find.text('Change Language'));
    await tester.pumpAndSettle();
    expect(find.text('Merhaba'), findsOneWidget);
    expect(find.text('dene John ve 20'), findsOneWidget);
    await shot('09_locale_tr');

    await tester.tap(find.text('tr() in a toast'));
    await wait(tester, 500);
    expect(find.text('Merhaba'), findsNWidgets(2));
    await shot('10_locale_tr_toast');
    PentaToastController.I.dismissAll();
    await wait(tester, 600);

    await tester.tap(find.text('Dili Değiştir'));
    await tester.pumpAndSettle();
    await back(tester);

    // --------------------------------------------------------- showcase
    await open(tester, 'Showcase Example');
    await tester.pump(const Duration(milliseconds: 500));
    expect(find.text('Bu butona dikkat et!'), findsOneWidget);
    expect(find.byType(PentaDrawArrowCustomPaint), findsOneWidget);
    await shot('11_showcase_open');

    await tester.tapAt(const Offset(20, 300));
    await tester.pumpAndSettle();
    expect(find.text('Bu butona dikkat et!'), findsNothing);
    await shot('12_showcase_closed');
    await back(tester);
  });
}
