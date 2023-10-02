import 'dart:io';

import 'package:path_provider/path_provider.dart';

class ScreenshotPath {
  static Future<String> getScreenPathLinux(
      {String? path, String? filename, String? fileExtension}) async {
    String baseDir = '${(await getApplicationCacheDirectory()).path}/img';
    path = path ?? baseDir;
    filename = filename ?? DateTime.now().toIso8601String();
    fileExtension = fileExtension ?? '.png';
    if (!(await Directory(path).exists())) {
      await Directory(path).create(recursive: true);
    }
    return "$path/$filename$fileExtension";
  }
}
