import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gap(20.0),
              AddCustomFoodForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class AddCustomFoodForm extends StatefulWidget {
  const AddCustomFoodForm({super.key});

  @override
  State<AddCustomFoodForm> createState() => _AddCustomFoodFormState();
}

class _AddCustomFoodFormState extends State<AddCustomFoodForm> {
  // Global key variable for the current form so that we can validate the form entries
  final _customFoodFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _customFoodFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Row(children: [
              const FaIcon(FontAwesomeIcons.pizzaSlice),
              const Gap(8.0),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Food name",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
            ]),
            const Gap(20.0),
            Row(children: [
              const FaIcon(FontAwesomeIcons.spoon),
              const Gap(8.0),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Serving size",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter serving size';
                    }
                    return null;
                  },
                ),
              ),
            ]),
            const Gap(20.0),
            Row(children: [
              const FaIcon(FontAwesomeIcons.squarePlus),
              const Gap(8.0),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Quantity",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter quantity';
                    }
                    return null;
                  },
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
