// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:ansicolor/ansicolor.dart';

Future<void> main(List<String> arguments) async {
  final pen = AnsiPen()..white(bold: true);

  if (arguments.length < 3) {
    pen.red(bold: true);
    print(pen('Error: Arguments required'));
    pen.yellow(bold: true);
    print(
      pen(
        'Usage: flutter pub run penta_core:lang_generator <input_json_file_path> <output_folder_path> <output_class_name>',
      ),
    );
    pen.blue(bold: true);
    print(
      pen(
        'Example: flutter pub run penta_core:lang_generator ./assets/lang/en.json ./lib/generated LocaleKeys',
      ),
    );
    exit(1);
  }

  final inputFilePath = arguments[0];
  final inputFile = File(inputFilePath);

  if (!inputFile.existsSync()) {
    pen.red(bold: true);
    print('Error: File not found: $inputFilePath');
    exit(1);
  }

  final inputJson =
      jsonDecode(await inputFile.readAsString()) as Map<String, dynamic>;
  final outputClass = arguments[2];
  final outputFile = '${_toSnakeCase(outputClass)}.g.dart';

  final constants = _generateConstants(inputJson);

  final dartCode = '''
// GENERATED CODE - DO NOT MODIFY BY HAND

class $outputClass {
  $outputClass._();

${constants.entries.map((entry) {
    final key = entry.key;
    final value = entry.value;
    final argsCount = _countPlaceholders(value['value']!);
    final argsSuffix = argsCount > 0 ? 'Args$argsCount' : '';
    return "\tstatic String get $key$argsSuffix => '${value['key']}';";
  }).join('\n')}
}
''';

  final outputFilePath = '${arguments[1]}/$outputFile';
  final outputFileDir = Directory(arguments[1]);
  if (!outputFileDir.existsSync()) {
    await outputFileDir.create(recursive: true);
  }

  await File(outputFilePath).writeAsString(dartCode);
  print('Generated file: $outputFilePath');
}

Map<String, Map<String, String>> _generateConstants(
  Map<String, dynamic> json, [
  String prefix = '',
]) {
  final constants = <String, Map<String, String>>{};

  json.forEach((key, value) {
    if (value is Map<String, dynamic>) {
      constants.addAll(_generateConstants(value, '$prefix$key.'));
    } else {
      final toKey = prefix.isNotEmpty ? '$prefix$key' : key;
      final constantKey = _toCamelCase(toKey.split('.'));
      constants[constantKey] = {'key': toKey, 'value': value.toString()};
    }
  });

  return constants;
}

String _toCamelCase(List<String> parts) {
  return parts.asMap().entries.map((entry) {
    final index = entry.key;
    final part = entry.value;
    return index == 0 ? part : '${part[0].toUpperCase()}${part.substring(1)}';
  }).join();
}

String _toSnakeCase(String input) {
  return input
      .replaceAllMapped(
        RegExp('([A-Z])'),
        (match) => '_${match.group(0)!.toLowerCase()}',
      )
      .substring(1);
}

int _countPlaceholders(String value) {
  return RegExp('{([^}]*)}').allMatches(value).length;
}
