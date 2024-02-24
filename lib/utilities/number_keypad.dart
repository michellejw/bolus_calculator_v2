import 'package:flutter/material.dart';

class NumericKeypad extends StatefulWidget {
  final Function(String) onValueChanged;

  NumericKeypad({required this.onValueChanged});

  @override
  _NumericKeypadState createState() => _NumericKeypadState();
}

class _NumericKeypadState extends State<NumericKeypad> {
  String _inputValue = '';

  void _appendDigit(String digit) {
    setState(() {
      _inputValue += digit;
    });
  }

  void _deleteDigit() {
    setState(() {
      if (_inputValue.isNotEmpty) {
        _inputValue = _inputValue.substring(0, _inputValue.length - 1);
      }
    });
  }

  void _enterValue() {
    widget.onValueChanged(_inputValue);
    _inputValue = '';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          readOnly: true,
          controller: TextEditingController(text: _inputValue),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Entered Value',
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildDigitButton('1'),
            _buildDigitButton('2'),
            _buildDigitButton('3'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildDigitButton('4'),
            _buildDigitButton('5'),
            _buildDigitButton('6'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildDigitButton('7'),
            _buildDigitButton('8'),
            _buildDigitButton('9'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildActionButton('⌫', _deleteDigit),
            _buildDigitButton('0'),
            _buildActionButton('done', _enterValue),
          ],
        ),
      ],
    );
  }

  // TODO: fix button alignment
  Widget _buildDigitButton(String digit) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: FilledButton(
        onPressed: () => _appendDigit(digit),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            digit,
            style: const TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(String label, Function() onPressed) {
    return FilledButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 20.0,
        ),
      ),
    );
  }
}
