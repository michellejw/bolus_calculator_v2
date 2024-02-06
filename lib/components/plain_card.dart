import 'package:flutter/material.dart';

class PlainCard extends StatelessWidget {
  const PlainCard({super.key, this.cardColor, this.cardWidget});

  final Color? cardColor;
  final Widget? cardWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: cardWidget,
    );
  }
}
