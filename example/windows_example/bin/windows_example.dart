import 'package:screenshot/screenshot.dart';

void main(List<String> arguments) async {
  ScreenShotModel? s = await ScreenShotService.takeScreenshot(
      path: 'C:\\Users\\BlackPL\\Desktop\\example',
      fileExtension: 'png',
      filename: 'sss');
  print(s?.path);
  print(s?.createdAt);
  // Null when Error occurred or when the OS is not supported
}
