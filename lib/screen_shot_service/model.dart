import 'dart:io';

import 'package:flutter/material.dart';

class ScreenShotModel {
  String path;
  DateTime createdAt;
  ScreenShotModel({required this.path, required this.createdAt});
  File getFile() {
    return File(path);
  }

  ImageProvider getImage() {
    return Image.file(File(path)).image;
  }
}
