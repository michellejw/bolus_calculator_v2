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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[],
        ),
      ),
    );
  }
}
