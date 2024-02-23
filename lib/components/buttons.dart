import 'package:flutter/material.dart';
import 'package:bolus_calculator_v2/components/number_keypad.dart';
import 'package:bolus_calculator_v2/utilities/constants.dart';

class EnterButton extends StatelessWidget {
  const EnterButton({
    super.key,
    required this.entered,
    required this.onUpdate,
    required this.value,
  });

  final bool entered;
  final void Function(String p1) onUpdate;
  final String value;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: ButtonStyle(
        backgroundColor: entered
            ? MaterialStateProperty.all(Colors.green)
            : MaterialStateProperty.all(
                Theme.of(context).colorScheme.secondary),
      ),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => NumericKeypad(
            onValueChanged: (newValue) {
              Navigator.pop(context); // Close the keypad
              onUpdate(newValue); // Update value based on button
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          value,
          style: kSettingsButtonTextStyle,
        ),
      ),
    );
  }
}

class ResetButton extends StatelessWidget {
  final VoidCallback onReset;

  const ResetButton({Key? key, required this.onReset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Theme.of(context).colorScheme.tertiary,
        ),
      ),
      onPressed: onReset,
      child: const Text(
        'Reset',
        style: kSettingsButtonTextStyle,
      ),
    );
  }
}
