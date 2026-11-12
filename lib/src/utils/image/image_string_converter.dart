import 'package:flutter/widgets.dart';
import 'package:penta_core/src/extensions/string_ext.dart';
import 'package:penta_core/src/utils/image/file_image_stub.dart'
    if (dart.library.io) 'package:penta_core/src/utils/image/file_image_io.dart';

/// Picks the right [ImageProvider] for an image string.
///
/// | Input                                   | Provider        |
/// |-----------------------------------------|-----------------|
/// | `http://`, `https://`                   | [NetworkImage]  |
/// | `data:image/png;base64,...`             | [MemoryImage]   |
/// | `assets/...`, `packages/...`            | [AssetImage]    |
/// | `/abs/path`, `file://`, `C:\path`       | `FileImage` (not on web) |
abstract final class ImageStringConverter {
  static final RegExp _windowsPath = RegExp(r'^[a-zA-Z]:[\\/]');

  /// Provider for [image], or `null` when it cannot be resolved.
  static ImageProvider? toImageProvider(String image) {
    final value = image.trim();
    if (value.isEmpty) return null;
    try {
      if (value.startsWith('http://') || value.startsWith('https://')) {
        return NetworkImage(value);
      }
      if (value.startsWith('data:')) {
        return MemoryImage(value.ext.toUint8List);
      }
      if (value.startsWith('assets/') || value.startsWith('packages/')) {
        return AssetImage(value);
      }
      if (value.startsWith('/') ||
          value.startsWith('file://') ||
          _windowsPath.hasMatch(value)) {
        return fileImageProvider(value);
      }
    } on Object catch (_) {
      return null;
    }
    return null;
  }

  /// Builds with [builder] when [image] resolves, otherwise shows [onError].
  static Widget imageProviderBuilder({
    required String image,
    required Widget onError,
    required Widget Function(ImageProvider provider) builder,
  }) {
    final provider = toImageProvider(image);
    return provider == null ? onError : builder(provider);
  }
}
