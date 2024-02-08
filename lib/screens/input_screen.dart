import 'package:bolus_calculator_v2/screens/add_food_screen.dart';
import 'package:flutter/material.dart';
import 'package:bolus_calculator_v2/components/plain_card.dart';
import 'package:bolus_calculator_v2/components/text_button_card.dart';
import 'package:bolus_calculator_v2/components/input_form.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: PlainCard(
                cardColor: Colors.amber,
                cardWidget: TextButtonCard(
                  buttonText: 'ADD FOOD',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return const AddFoodPage();
                      }),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: PlainCard(
                cardColor: Colors.orange.shade100,
                cardWidget: const InputForm(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
