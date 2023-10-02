import 'dart:io';

import 'package:process_run/process_run.dart';
import 'package:screenshot/screen_shot_service/screenshotpath.dart';

import 'model.dart';

class ScreenShotService {
  static Future<ScreenShotModel?> takeScreenshot(
      {String? path, String? filename, String? fileExtension}) async {
    if (Platform.isLinux) {
      String file = await ScreenshotPath.getScreenPathLinux(
          fileExtension: fileExtension, filename: filename, path: path);
      Shell shell = Shell(runInShell: true, workingDirectory: 'scripts');
      await shell.run('''
          gnome-screenshot -f $file
          ''');
      return ScreenShotModel(path: file, createdAt: DateTime.now());
    }
  }
}
