import 'package:flutter/material.dart';
import 'package:bolus_calculator_v2/utilities/constants.dart';
import 'package:bolus_calculator_v2/components/buttons.dart';

class SettingsInputRow extends StatelessWidget {
  final String inputText;
  final String value;
  final bool entered;
  final void Function(String) onUpdate;

  const SettingsInputRow({
    Key? key,
    required this.inputText,
    required this.value,
    required this.entered,
    required this.onUpdate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                inputText,
                style: kSettingsTextStyle,
              ),
            ],
          ),
          Column(
            children: [
              EnterButton(entered: entered, onUpdate: onUpdate, value: value),
            ],
          )
        ],
      ),
    );
  }
}
