import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TextButtonCard extends StatelessWidget {
  TextButtonCard({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.buttonFontSize = 25.0,
  });

  final String buttonText;
  final VoidCallback onTap;
  double buttonFontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Gap(15),
          Center(
            child: Text(
              buttonText,
              style: TextStyle(
                fontSize: buttonFontSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
