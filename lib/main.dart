import 'package:flutter/material.dart';
import 'screens/entry_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bolus Calculator',
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark, // For dark mode
      ),
      themeMode: ThemeMode.system,
      home: const MyHomePage(title: 'Insulin Dosing Calculator'),
    );
  }
}
