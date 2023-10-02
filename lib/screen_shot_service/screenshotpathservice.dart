import 'package:screenshot/screenshotpath/screenshotpathwindows.dart';

import '../screenshotpath/screenshotpathlinux.dart';

class ScreenShotPathService {
  static Future<String> getWindowsPath(
      {String? path, String? filename, String? fileExtension}) async {
    return ScreenshotPathWindows.getScreenshotPathWindows(
        filename: filename, fileExtension: fileExtension, path: path);
  }

  static Future<String> getLinuxPath(
      {String? path, String? filename, String? fileExtension}) async {
    return ScreenshotPathLinux.getScreenshotPathLinux(
        filename: filename, fileExtension: fileExtension, path: path);
  }
}
