import 'package:flutter/material.dart';
import 'package:bolus_calculator_v2/screens/add_food_screen.dart';
import 'package:gap/gap.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class InputScreen extends StatefulWidget {
  InputScreen({super.key, required this.pc});
  final PanelController? pc;

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const AddFoodPage();
            }));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 40.0),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: const Text(
                  'ADD FOOD',
                  style: TextStyle(fontSize: 25.0),
                ),
              ),
            ],
          ),
        ),
        const Gap(30.0),
        Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Column(
                    children: <Widget>[
                      Text(
                        'Insulin Sensitivity',
                        style: TextStyle(fontSize: 25.0),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      FilledButton(
                        onPressed: () {
                          widget.pc!.open();
                        },
                        child: const Text(
                          'enter',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
