import 'package:flutter/material.dart';
import 'package:bolus_calculator_v2/screens/add_food_screen.dart';
import 'package:gap/gap.dart';
import 'package:bolus_calculator_v2/utilities/constants.dart';
import 'package:bolus_calculator_v2/utilities/user_input_row.dart';
import 'package:bolus_calculator_v2/utilities/buttons.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String insulinSensitivity = 'Enter';
  String carbRatio = 'Enter';
  String targetBloodGlucose = 'Enter';

  bool insulinSensitivityEntered = false;
  bool carbRatioEntered = false;
  bool targetBloodGlucoseEntered = false;

  void updateInsulinSensitivity(String value) {
    setState(() {
      insulinSensitivity = value;
      insulinSensitivityEntered = true;
    });
  }

  void updateCarbRatio(String value) {
    setState(() {
      carbRatio = value;
      carbRatioEntered = true;
    });
  }

  void updateTargetBloodGlucose(String value) {
    setState(() {
      targetBloodGlucose = value;
      targetBloodGlucoseEntered = true;
    });
  }

  void resetValues() {
    setState(() {
      insulinSensitivity = 'Enter';
      carbRatio = 'Enter';
      targetBloodGlucose = 'Enter';
      insulinSensitivityEntered = false;
      carbRatioEntered = false;
      targetBloodGlucoseEntered = false;
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
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const ListFoodPage();
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
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Text(
                      'ADD FOOD',
                      style: TextStyle(
                          fontSize: 25.0,
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(30.0),
            SettingsInputRow(
              inputText: 'Insulin Sensitivity',
              value: insulinSensitivity,
              entered: insulinSensitivityEntered,
              onUpdate: updateInsulinSensitivity,
            ),
            const Gap(15.0),
            SettingsInputRow(
              inputText: 'Carb Ratio',
              value: carbRatio,
              entered: carbRatioEntered,
              onUpdate: updateCarbRatio,
            ),
            const Gap(15.0),
            SettingsInputRow(
              inputText: 'Target BG',
              value: targetBloodGlucose,
              entered: targetBloodGlucoseEntered,
              onUpdate: updateTargetBloodGlucose,
            ),
            const Gap(30.0),
            ResetButton(
              onReset: resetValues,
            ),
          ],
        ),
      ),
    );
  }
}
