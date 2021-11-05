import 'package:flutter/material.dart';
import 'package:reel_oader/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Reeloader',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: MainScreen());
  }
}
