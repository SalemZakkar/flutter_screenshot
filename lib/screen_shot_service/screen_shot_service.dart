import 'dart:io';

import 'package:process_run/process_run.dart';
import 'package:screenshot/screen_shot_service/screenshotpathservice.dart';
import 'model.dart';

class ScreenShotService {
  static Future<ScreenShotModel?> takeScreenshot(
      {String? path, String? filename, String? fileExtension}) async {
    Shell shell = Shell(runInShell: true, workingDirectory: 'scripts');
    if (Platform.isLinux) {
      String file = await ScreenShotPathService.getLinuxPath(
          fileExtension: fileExtension, filename: filename, path: path);
      await shell.run('''
          gnome-screenshot -f $file
          ''');
      return ScreenShotModel(path: file, createdAt: DateTime.now());
    }
    if (Platform.isWindows) {
      String file = await ScreenShotPathService.getWindowsPath(
          fileExtension: fileExtension, filename: filename, path: path);
      await shell.run('''
          screen-shot.exe $file
          ''');
      return ScreenShotModel(path: file, createdAt: DateTime.now());
    }
  }
}
