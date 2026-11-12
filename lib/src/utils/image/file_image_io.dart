import 'dart:io';

import 'package:flutter/widgets.dart';

ImageProvider? fileImageProvider(String path) => FileImage(
  File(path.startsWith('file://') ? Uri.parse(path).toFilePath() : path),
);
