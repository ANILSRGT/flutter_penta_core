part of 'string_ext.dart';

final class _RandomStringExt {
  const _RandomStringExt(String? value) : _value = value;

  final String? _value;

  String get imagePortrait => 'https://picsum.photos/seed/$_value/300/400';
  String get imageLandscape => 'https://picsum.photos/seed/$_value/400/300';
  String get imageSquare => 'https://picsum.photos/seed/$_value/300/300';
}
