part of 'extensions.dart';

extension PentaTextStyleExtension on TextStyle {
  int maxLines(double height) {
    int lines = ((height / (fontSize ?? 14)) * 0.8).floor();
    lines = lines > 0 ? lines : 1;
    return lines;
  }
}
