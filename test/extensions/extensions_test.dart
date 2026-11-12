import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:penta_core/penta_core.dart';

void main() {
  group('AppValues', () {
    tearDown(AppValues.reset);

    test('uses defaults', () {
      expect(AppValues.md.value, 12);
      expect(AppValues.md.ext.padding.all, const EdgeInsets.all(12));
      expect(
        AppValues.sm.ext.radius.border.directional.top,
        const BorderRadius.vertical(top: Radius.circular(8)),
      );
    });

    test('configure overrides values', () {
      AppValues.configure(const AppValuesConfig(md: 14));
      expect(AppValues.md.value, 14);
      expect(AppValues.lg.value, 16);
    });
  });

  group('ColorExt', () {
    test('toInt and toHex', () {
      const color = Color(0xFF112233);
      expect(color.ext.toInt, 0xFF112233);
      expect(color.ext.toHex(), '#FF112233');
      expect(color.ext.toHex(includeAlpha: false), '#112233');
    });

    test('toMaterialColor builds a full swatch', () {
      final swatch = const Color(0xFF2196F3).ext.toMaterialColor;
      expect(swatch.shade500, const Color(0xFF2196F3));
      for (final shade in [50, 100, 200, 300, 400, 600, 700, 800, 900]) {
        expect(swatch[shade], isNotNull, reason: 'shade $shade');
      }
      expect(
        swatch.shade50.computeLuminance(),
        greaterThan(swatch.shade900.computeLuminance()),
      );
    });
  });

  group('DateTimeExt', () {
    test('plus / minus keep UTC kind', () {
      final date = DateTime.utc(2024, 1, 31);
      expect(date.ext.plus(day: 1), DateTime.utc(2024, 2));
      expect(date.ext.minus(month: 1), DateTime.utc(2023, 12, 31));
      expect(date.ext.plus(day: 1).isUtc, isTrue);
    });

    test('isSameDay compares in the same time zone', () {
      final a = DateTime(2024, 5, 10, 23, 59);
      expect(a.ext.isSameDay(DateTime(2024, 5, 10, 0, 1)), isTrue);
      expect(a.ext.isSameDay(DateTime(2024, 5, 11)), isFalse);
      expect(a.ext.isSameDay(a.toUtc()), isTrue);
    });

    test('timeAgo and timeWhen', () {
      final now = DateTime(2024, 5, 10, 12);
      expect(
        now.subtract(const Duration(minutes: 5)).ext.timeAgo(now: now),
        '5m',
      );
      expect(
        now.subtract(const Duration(hours: 3)).ext.timeAgo(now: now),
        '3h',
      );
      expect(
        now.subtract(const Duration(days: 2)).ext.timeAgo(now: now),
        '08/05/2024',
      );
      expect(now.add(const Duration(hours: 2)).ext.timeWhen(now: now), 'Today');
      expect(
        now.add(const Duration(days: 1)).ext.timeWhen(now: now),
        'Tomorrow',
      );
      expect(
        now.subtract(const Duration(hours: 1)).ext.timeWhen(now: now),
        'Past',
      );
      expect(
        now
            .add(const Duration(hours: 2))
            .ext
            .timeWhen(now: now, labels: const DateTimeLabels.tr()),
        'Bugün',
      );
    });

    test('startOfDay / endOfDay', () {
      final date = DateTime(2024, 5, 10, 13, 45);
      expect(date.ext.startOfDay, DateTime(2024, 5, 10));
      expect(date.ext.endOfDay, DateTime(2024, 5, 10, 23, 59, 59, 999, 999));
    });
  });

  group('NumExt', () {
    test('formatShort', () {
      expect(999.ext.formatShort(), '999');
      expect(1500.ext.formatShort(), '1.5K');
      expect(2000000.ext.formatShort(), '2M');
      expect(999999.ext.formatShort(), '1M');
      expect((-1500).ext.formatShort(), '-1.5K');
      expect(1500.ext.formatShort(locale: const Locale('tr')), '1.5B');
    });

    test('digitsCount, lerp, remap', () {
      expect(0.ext.digitsCount, 1);
      expect((-12345).ext.digitsCount, 5);
      expect(0.ext.lerp(10, .5), 5);
      expect(0.ext.lerp(10, 2), 10);
      expect(5.ext.remap(0, 10, 0, 100), 50);
    });
  });

  group('StringExt', () {
    test('email validation', () {
      expect('john@gmail.com'.ext.validEmail, isTrue);
      expect('john@company.online'.ext.validEmail, isTrue);
      expect('john@mailinator.com'.ext.validEmailRegex, isTrue);
      expect('john@mailinator.com'.ext.validEmail, isFalse);
      expect('not-an-email'.ext.validEmail, isFalse);
      expect('john@acme.com'.ext.validEmailWithWhiteList(['acme.com']), isTrue);
      expect(
        'john@gmail.com'.ext.validEmailWithWhiteList(['acme.com']),
        isFalse,
      );
    });

    test('phone validation', () {
      expect('+90 555 123 45 67'.ext.validPhoneWithPlus, isTrue);
      expect('+905551234567'.ext.validPhoneWithPlus, isTrue);
      expect('905551234567'.ext.validPhoneWithPlus, isFalse);
      expect('0555 123 45 67'.ext.validPhoneWithoutPlus, isTrue);
      expect('abc'.ext.validPhoneWithoutPlus, isFalse);
    });

    test('null helpers and casing', () {
      const String? nothing = null;
      expect(nothing.ext.isNullOrEmpty, isTrue);
      expect('  '.ext.isNullOrBlank, isTrue);
      expect(''.ext.nullIfEmpty, isNull);
      expect('hello world'.ext.capitalized, 'Hello world');
      expect('hello world'.ext.titleCase, 'Hello World');
    });

    test('base64 and data URI decoding', () {
      expect('AQID'.ext.toUint8List, Uint8List.fromList([1, 2, 3]));
      expect(
        'data:application/octet-stream;base64,AQID'.ext.toUint8List,
        Uint8List.fromList([1, 2, 3]),
      );
      expect(Uint8List.fromList([1, 2, 3]).ext.toBase64, 'AQID');
    });

    test('random images do not throw', () {
      expect(''.ext.randomImageSquare, startsWith('https://picsum.photos/'));
      expect('seed'.ext.imagePortrait, contains('/seed/seed/300/400'));
    });
  });

  group('Iterable / List / Map', () {
    test('iterable helpers', () {
      expect([1, 2, 3].ext.firstWhereOrNull((e) => e > 1), 2);
      expect([1, 2, 3].ext.firstWhereOrNull((e) => e > 5), isNull);
      expect([1, 2, 3].ext.separatedBy(0), [1, 0, 2, 0, 3]);
      expect(<int>[].ext.separatedBy(0), isEmpty);
      expect([1, 2, 3, 4, 5].ext.chunked(2).toList(), [
        [1, 2],
        [3, 4],
        [5],
      ]);
      expect(['a', 'bb', 'cc'].ext.distinctBy((e) => e.length), ['a', 'bb']);
    });

    test('sorted does not mutate', () {
      final list = [3, 1, 2];
      expect(list.ext.sorted(), [1, 2, 3]);
      expect(list, [3, 1, 2]);
      expect(list.ext.getOrNull(5), isNull);
    });

    test('map helpers', () {
      final map = {'a': 1, 'b': 2, 'c': null};
      expect(map.ext.whereNot((_, v) => v == 1), {'b': 2, 'c': null});
      expect(map.ext.withoutNulls, {'a': 1, 'b': 2});
      expect(map, hasLength(3));
    });
  });

  test('BoolExt', () {
    expect(true.ext.not, isFalse);
    expect(true.ext.toInt, 1);
    expect(false.ext.pick('y', 'n'), 'n');
  });
}
