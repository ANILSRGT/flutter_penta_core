part of 'string_ext.dart';

mixin _RandomStringExt {
  String? get _value;

  String get imagePortrait =>
      _value != null && _value.isNotEmpty
          ? 'https://picsum.photos/seed/$_value/300/400'
          : 'https://picsum.photos/300/400';
  String get imageLandscape =>
      _value != null && _value.isNotEmpty
          ? 'https://picsum.photos/seed/$_value/400/300'
          : 'https://picsum.photos/400/300';
  String get imageSquare =>
      _value != null && _value.isNotEmpty
          ? 'https://picsum.photos/seed/$_value/300/300'
          : 'https://picsum.photos/300/300';

  String get randomImagePortrait =>
      'https://picsum.photos/seed/${_generateRandomString(10)}/300/400';
  String get randomImageLandscape =>
      'https://picsum.photos/seed/${_generateRandomString(10)}/400/300';
  String get randomImageSquare =>
      'https://picsum.photos/seed/${_generateRandomString(10)}/300/300';

  String _generateRandomString(int length) {
    return math.Random().nextInt(9999999999).toString().padLeft(length, '0');
  }
}
