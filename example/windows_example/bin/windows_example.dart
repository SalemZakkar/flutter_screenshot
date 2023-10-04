import 'package:screenshot/screenshot.dart';

void main(List<String> arguments) async {
  ScreenShotModel? s = await ScreenShotService.takeScreenshot(
      path: '', fileExtension: '', filename: '');
  // Null when Error occurred or when the OS is not supported
}
