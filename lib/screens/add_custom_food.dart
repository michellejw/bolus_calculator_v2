import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddCustomFood extends StatefulWidget {
  const AddCustomFood({super.key});

  @override
  State<AddCustomFood> createState() => _AddCustomFoodState();
}

class _AddCustomFoodState extends State<AddCustomFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Custom Food'),
        ),
        body: const SafeArea(
            child: Column(
          children: [
            Gap(20.0),
          ],
        )));
  }
}
