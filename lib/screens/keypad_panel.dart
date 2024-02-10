import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:bolus_calculator_v2/screens/input_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PanelController _pc = PanelController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: SlidingUpPanel(
          controller: _pc,
          panel: const Center(
            child: Text('hi hi'),
          ),
          minHeight: 0,
          maxHeight: 350,
          body: InputScreen(
            pc: _pc,
          ),
        ),
      ),
    );
  }
}
