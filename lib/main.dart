import 'package:flutter/material.dart';
import 'package:json_with_ui/Screens/screen_selecter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JSON with UI',
      home: ScreenSelecter(),
    );
  }
}
