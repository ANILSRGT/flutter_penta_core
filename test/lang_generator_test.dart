import 'package:flutter_test/flutter_test.dart';

import '../bin/lang_generator.dart' as generator;

void main() {
  test('generates sanitized constants with argument suffixes', () {
    final code = generator.generate({
      'greeting': 'Hello',
      'home': {'title': 'Hi {}', 'sub-title': 'By {name} at {time}'},
      'class': 'reserved',
      '1st': 'number',
      'quote': "It's",
    }, 'LocaleKeys');

    expect(code, contains('abstract final class LocaleKeys'));
    expect(code, contains("static const String greeting = 'greeting';"));
    expect(
      code,
      contains("static const String homeTitleArgs1 = 'home.title';"),
    );
    expect(
      code,
      contains("static const String homeSubTitleArgs2 = 'home.sub-title';"),
    );
    expect(code, contains("static const String classKey = 'class';"));
    expect(code, contains("static const String k1st = '1st';"));
  });
}
