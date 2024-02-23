import 'package:bolus_calculator_v2/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ListFoodPage extends StatefulWidget {
  const ListFoodPage({super.key});

  @override
  State<ListFoodPage> createState() => _ListFoodPageState();
}

class _ListFoodPageState extends State<ListFoodPage> {
  final List<String> _foodList = [];

  void _editItem() {
    setState(() {
      // bring up the edit dialog screen
    });
  }

  void _deleteItem(int index) {
    setState(() {
      _foodList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Food'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Gap(20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton(
                  onPressed: () {},
                  child: const Text(
                    'Custom',
                    style: kSettingsButtonTextStyle,
                  ),
                ),
                const Gap(15.0),
                FilledButton(
                  onPressed: () {},
                  child: const Text(
                    'Search',
                    style: kSettingsButtonTextStyle,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
