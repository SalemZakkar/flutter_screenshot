import 'package:flutter/material.dart';
import 'package:screenshot_example/main_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'example',
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
      theme: ThemeData.light(),
    );
  }
}
