import 'dart:io';

class ScreenshotPathWindows {
  static Future<String> getScreenshotPathWindows(
      {String? path, String? filename, String? fileExtension}) async {
    String baseDir = '${Platform.environment['APPDATA']}\\.fayaCache\\.img';
    path = path ?? baseDir;
    filename = filename ?? DateTime.now().toIso8601String().replaceAll(':', '-');
    fileExtension = fileExtension ?? '.png';
    if (!(await Directory(path).exists())) {
      await Directory(path).create(recursive: true);
    }
    return "$path\\$filename$fileExtension";
  }

}
