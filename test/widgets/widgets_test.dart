import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:penta_core/penta_core.dart';

Widget _app(Widget child, {Size size = const Size(400, 800)}) => MaterialApp(
  home: MediaQuery(
    data: MediaQueryData(size: size),
    child: Scaffold(body: child),
  ),
);

void main() {
  group('Responsive', () {
    test('breakpoints select with fallback', () {
      const bp = PentaBreakpoints();
      expect(bp.select(500, normal: 'n', md: 'md'), 'n');
      expect(bp.select(700, normal: 'n', md: 'md'), 'n');
      expect(bp.select(800, normal: 'n', md: 'md'), 'md');
      expect(bp.select(2000, normal: 'n', md: 'md'), 'md');
    });

    testWidgets('wrapper breakpoints are applied', (tester) async {
      await tester.pumpWidget(
        _app(
          PentaResponsiveWrapper(
            breakPoints: const {PentaResponsiveResolutions.sm: 300},
            child: const PentaResponsiveWidget(
              normal: Text('normal'),
              sm: Text('sm'),
            ),
          ),
        ),
      );
      expect(find.text('sm'), findsOneWidget);
    });

    testWidgets('parentConstraints uses the parent width', (tester) async {
      await tester.pumpWidget(
        _app(
          const Center(
            child: SizedBox(
              width: 900,
              child: PentaResponsiveWidget(
                sizeType: PentaResponsiveSizeTypes.parentConstraints,
                normal: Text('normal'),
                md: Text('md'),
              ),
            ),
          ),
          size: const Size(1000, 800),
        ),
      );
      expect(find.text('md'), findsOneWidget);
    });
  });

  testWidgets('PentaAdaptiveWidget follows theme platform', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(platform: TargetPlatform.iOS),
        home: const PentaAdaptiveWidget.compact(
          defaultWidget: Text('default'),
          mobile: Text('mobile'),
        ),
      ),
    );
    expect(find.text('mobile'), findsOneWidget);
  });

  testWidgets('Gap sizes along the flex axis', (tester) async {
    await tester.pumpWidget(
      _app(Column(children: [const Gap(24), AppValues.md.ext.gap])),
    );
    final sizes = tester
        .renderObjectList<RenderBox>(find.byType(Gap))
        .map((box) => box.size.height)
        .toList();
    expect(sizes, [24, 12]);
  });

  testWidgets('PentaUnderlineText renders and handles taps', (tester) async {
    var tapped = false;
    await tester.pumpWidget(
      _app(
        PentaUnderlineText(
          children: [
            const PentaUnderlineTextSpan.notUnderlined(text: 'Read the '),
            PentaUnderlineTextSpan.underlined(
              text: 'terms',
              onTap: () => tapped = true,
            ),
          ],
        ),
      ),
    );
    expect(find.text('Read the terms', findRichText: true), findsOneWidget);
    await tester.tapOnText(find.textRange.ofSubstring('terms'));
    expect(tapped, isTrue);
  });

  group('WidgetStateMixin', () {
    testWidgets('moves busy → success', (tester) async {
      await tester.pumpWidget(
        _app(const _StatePage(result: ResponseModelSuccess(data: 'done'))),
      );
      expect(find.text('busy'), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.text('done'), findsOneWidget);
    });

    testWidgets('exceptions become fail', (tester) async {
      await tester.pumpWidget(_app(const _StatePage(result: null)));
      await tester.pumpAndSettle();
      expect(find.textContaining('fail'), findsOneWidget);
    });

    testWidgets('ignores results after dispose', (tester) async {
      await tester.pumpWidget(
        _app(const _StatePage(result: ResponseModelSuccess(data: 'done'))),
      );
      await tester.pumpWidget(_app(const SizedBox()));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    });
  });

  group('LoadingCallbackDialog', () {
    testWidgets('closes only its dialog and runs the callback', (tester) async {
      String? received;
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () => LoadingCallbackDialog.showLoadingDialog<String>(
                context: context,
                future: () => Future.delayed(
                  const Duration(milliseconds: 100),
                  () => 'value',
                ),
                callback: (value) => received = value,
              ),
              child: const Text('go'),
            ),
          ),
        ),
      );

      await tester.tap(find.text('go'));
      await tester.pump();
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.pump(const Duration(milliseconds: 150));
      await tester.pumpAndSettle();
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.text('go'), findsOneWidget);
      expect(received, 'value');
    });

    testWidgets('closes the dialog when the future throws', (tester) async {
      Object? caught;
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () => LoadingCallbackDialog.showLoadingDialog<void>(
                context: context,
                future: () => Future.delayed(
                  const Duration(milliseconds: 50),
                  () => throw StateError('x'),
                ),
                callback: (_) {},
                onError: (error, _) => caught = error,
              ),
              child: const Text('go'),
            ),
          ),
        ),
      );

      await tester.tap(find.text('go'));
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pumpAndSettle();
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(caught, isA<StateError>());
    });

    testWidgets('cancel skips the callback', (tester) async {
      var called = false;
      var canceled = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () => LoadingCallbackDialog.showLoadingDialog<int>(
                context: context,
                future: () =>
                    Future.delayed(const Duration(seconds: 1), () => 1),
                callback: (_) => called = true,
                cancelable: true,
                cancelableCallback: () => canceled = true,
              ),
              child: const Text('go'),
            ),
          ),
        ),
      );

      await tester.tap(find.text('go'));
      await tester.pump();
      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 2));

      expect(canceled, isTrue);
      expect(called, isFalse);
      expect(find.text('go'), findsOneWidget);
    });
  });
}

class _StatePage extends StatefulWidget {
  const _StatePage({required this.result});

  /// `null` throws inside the callback.
  final ResponseModel<String>? result;

  @override
  State<_StatePage> createState() => _StatePageState();
}

class _StatePageState extends State<_StatePage>
    with WidgetStateMixin<_StatePage, String> {
  @override
  void initState() {
    super.initState();
    unawaited(
      executeState(
        callback: () async {
          await Future<void>.delayed(const Duration(milliseconds: 10));
          return widget.result ?? (throw StateError('boom'));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) => buildState(
    idle: () => const Text('idle'),
    busy: () => const Text('busy'),
    success: Text.new,
    fail: (error) => Text('fail ${error.message}'),
  );
}
