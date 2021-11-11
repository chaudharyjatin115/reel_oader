import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:reel_oader/screens/main_screen.dart';

void main() async {
  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
      );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Reeloader',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: const MainScreen());
  }
}
