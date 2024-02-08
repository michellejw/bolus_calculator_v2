import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class InputForm extends StatefulWidget {
  const InputForm({super.key});

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  final _formKey = GlobalKey<FormState>();
  double _insulinSensitivity = 0.0;
  double _carbRatio = 0.0;
  double _targetBloodGlucose = 0.0;

  final FocusNode _insulinSensitivityFocusNode = FocusNode();
  final FocusNode _carbRatioFocusNode = FocusNode();
  final FocusNode _targetBloodGlucoseFocusNode = FocusNode();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
    // Do dosing calculation and navigate to the results page
  }

  String? _validatePositiveNumber(String? value) {
    // This function returns null if the input is value or an error message
    // if necessary to let the user know what to change.
    if (value == null || value.isEmpty) {
      return 'Please enter a number';
    }
    final number = double.tryParse(value);
    if (number == null || number <= 0) {
      return 'Please enter a positive number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextFormField(
                focusNode: _insulinSensitivityFocusNode,
                keyboardType: const TextInputType.numberWithOptions(
                  signed: true,
                  decimal: false,
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  // When "Next" button is pressed, move focus to the next field
                  FocusScope.of(context).requestFocus(_carbRatioFocusNode);
                },
                decoration: const InputDecoration(
                  labelText: 'Insulin Sensitivity',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                    borderSide: BorderSide(
                      // color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
                validator: _validatePositiveNumber,
                onSaved: (value) {
                  _insulinSensitivity = double.parse(value!);
                }),
            Gap(15.0),
            TextFormField(
                focusNode: _carbRatioFocusNode,
                decoration: const InputDecoration(
                  labelText: 'Carb ratio',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: false),
                validator: _validatePositiveNumber,
                onSaved: (value) {
                  _carbRatio = double.parse(value!);
                }),
            Gap(15.0),
            TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Target BG',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: false),
                validator: _validatePositiveNumber,
                onSaved: (value) {
                  _targetBloodGlucose = double.parse(value!);
                }),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  // Respond to button press
                },
                icon: const Icon(Icons.calculate, size: 30),
                label: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "CALCULATE DOSE",
                      style: TextStyle(fontSize: 20.0),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
