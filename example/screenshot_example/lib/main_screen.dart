import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScreenShot example'),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        alignment: Alignment.center,
        child: ElevatedButton(
            onPressed: () async {
              Directory d = await getApplicationDocumentsDirectory();
              ScreenShotModel? screenShotModel =
                  await ScreenShotService.takeScreenshot(
                      path: '${d.path.split('/Documents').first}/Desktop',
                      filename: 'Faya.dev',
                      fileExtension: '.png');
              debugPrint(screenShotModel?.path);
              debugPrint(screenShotModel?.createdAt.toString());
            },
            child: const Text('Take A screenshot')),
      ),
    );
  }
}
