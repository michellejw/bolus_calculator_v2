import 'package:flutter/material.dart';

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
                decoration:
                    const InputDecoration(labelText: 'Insulin Sensitivity'),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                validator: _validatePositiveNumber,
                onSaved: (value) {
                  _insulinSensitivity = double.parse(value!);
                }),
            TextFormField(
                decoration: const InputDecoration(labelText: 'Carb ratio'),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                validator: _validatePositiveNumber,
                onSaved: (value) {
                  _carbRatio = double.parse(value!);
                }),
            TextFormField(
                decoration: const InputDecoration(labelText: 'Target BG'),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                validator: _validatePositiveNumber,
                onSaved: (value) {
                  _targetBloodGlucose = double.parse(value!);
                }),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Calculate dose'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
