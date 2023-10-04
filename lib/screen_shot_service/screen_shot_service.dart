import 'dart:io';

import 'package:process_run/process_run.dart';
import 'model.dart';

class ScreenShotService {
  static Future<ScreenShotModel?> takeScreenshot(
      {required String path,
      required String filename,
      required String fileExtension}) async {
    Shell shell = Shell(
      workingDirectory: 'scripts',
      runInShell: true,
    );
    if (Platform.isLinux) {
      if (filename.contains('/') || fileExtension.contains('/')) {
        throw Exception('File Name and file extension can\'t have ( / )');
      }
      String file = "$path/$filename.$fileExtension";
      await shell.run('''
        ./linux-screenshot -f $file
          ''');
      return ScreenShotModel(path: file, createdAt: DateTime.now());
    }
    if (Platform.isWindows) {
      String file = "$path\\$filename\\.$fileExtension";
      List bannedChars = ['/', '\\', '"', '<', '>', ':', '|', '?', '*'];
      bool band = false;
      for (var e in bannedChars) {
        band = fileExtension.contains(e) || filename.contains(e);
        if (band) {
          break;
        }
      }
      assert(band,
          'File Name and file extension can\'t have ( /  \\  "  ?  *  | < > : )');
      await shell.run('''
          screen-shot.exe $file
          ''');
      return ScreenShotModel(path: file, createdAt: DateTime.now());
    }
    throw (Exception(
        '${Platform.operatingSystem} is not supported right now !'));
  }
}
