import 'dart:io';

import 'package:flutter/material.dart';
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
              ScreenShotModel? screenShotModel =
                  await ScreenShotService.takeScreenshot(
                      path: '${Platform.environment['SNAP_REAL_HOME']}/Desktop',
                      filename: 'sjj',
                      fileExtension: 'png');
              // debugPrint(screenShotModel?.path);
              // debugPrint(screenShotModel?.createdAt.toString());
            },
            child: const Text('Take A screenshot')),
      ),
    );
  }
}
