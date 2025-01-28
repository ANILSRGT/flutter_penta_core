import 'dart:io';

import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';

final class ImageStringConverter {
  const ImageStringConverter._();

  static ImageProvider? _imageProviderChecker(String image) {
    try {
      if (image.startsWith('http')) {
        return NetworkImage(image);
      } else if (image.startsWith('assets')) {
        return AssetImage(image);
      } else if (RegExp(r'^\w+:').hasMatch(image)) {
        return FileImage(File(image));
      } else if (image.startsWith('data')) {
        return MemoryImage(image.ext.convert.toUint8List);
      }
    } on Exception catch (_) {
      return null;
    }

    return null;
  }

  static Widget imageProviderBuilder({
    required String image,
    required Widget onError,
    required Widget Function(ImageProvider) builder,
  }) {
    final imageProvider = _imageProviderChecker(image);
    if (imageProvider != null) {
      return builder(imageProvider);
    } else {
      return onError;
    }
  }
}
