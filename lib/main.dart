import 'package:flutter/material.dart';
import 'package:axeta/screens/main_screen/main_screen.dart';
import 'di.dart' as di;

void main() async {
  await di.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'AxetaTest',
      home: MainScreen(),
    );
  }
}