import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:penta_core/penta_core.dart';

void main() {
  const config = PentaToastConfig(
    duration: Duration(milliseconds: 500),
    animationDuration: Duration(milliseconds: 100),
    delayBetweenToasts: Duration(milliseconds: 50),
    maxToasts: 5,
  );

  Widget app() => MaterialApp(
    builder: (context, child) => PentaToast(config: config, child: child),
    home: const Scaffold(body: Text('home')),
  );

  tearDown(() => PentaToastController.I.dismissAll());

  /// Advances time frame by frame so animations and timers both progress.
  Future<void> advance(WidgetTester tester, int milliseconds) async {
    for (var t = 0; t < milliseconds; t += 20) {
      await tester.pump(const Duration(milliseconds: 20));
    }
  }

  testWidgets('shows toasts one after another', (tester) async {
    await tester.pumpWidget(app());
    final dismissed = <String>[];

    PentaToastController.I
      ..showText(
        text: 'first',
        options: PentaToastShowOptions(
          onDismissed: () => dismissed.add('first'),
        ),
      )
      ..showText(text: 'second');

    await tester.pump();
    expect(find.text('first'), findsOneWidget);
    expect(find.text('second'), findsNothing);

    // enter (100) + visible (500) + exit (100) + frame slack
    await advance(tester, 800);
    expect(find.text('first'), findsNothing);
    expect(dismissed, ['first']);

    await advance(tester, 100);
    expect(find.text('second'), findsOneWidget);

    await advance(tester, 900);
    expect(find.text('second'), findsNothing);
  });

  testWidgets('dismissAll option replaces queued toasts', (tester) async {
    await tester.pumpWidget(app());

    PentaToastController.I
      ..showText(text: 'a')
      ..showText(text: 'b')
      ..showText(
        text: 'c',
        options: const PentaToastShowOptions(dismissAll: true),
      );
    await tester.pump();

    expect(find.text('a'), findsNothing);
    expect(find.text('c'), findsOneWidget);
    await advance(tester, 2000);
    expect(find.text('a'), findsNothing);
    expect(find.text('b'), findsNothing);
  });

  testWidgets('requests before mount are shown later', (tester) async {
    PentaToastController.I.showText(text: 'early');
    await tester.pumpWidget(app());
    await tester.pump();
    expect(find.text('early'), findsOneWidget);
    await advance(tester, 900);
    expect(find.text('early'), findsNothing);
  });

  testWidgets('swipe dismisses', (tester) async {
    await tester.pumpWidget(app());
    var dismissed = false;
    PentaToastController.I.showText(
      text: 'swipe me',
      options: PentaToastShowOptions(onDismissed: () => dismissed = true),
    );
    await advance(tester, 200);

    await tester.fling(find.text('swipe me'), const Offset(0, 300), 1000);
    await tester.pumpAndSettle();

    expect(find.text('swipe me'), findsNothing);
    expect(dismissed, isTrue);
  });
}
