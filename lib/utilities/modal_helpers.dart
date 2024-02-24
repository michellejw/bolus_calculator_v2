import 'package:flutter/material.dart';
import 'package:bolus_calculator_v2/screens/add_custom_food.dart';

void showCustomModalBottomSheet(BuildContext context, Widget child) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    useSafeArea: true,
    builder: (context) {
      return ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.only(top: 24),
          child: const AddCustomFood(),
        ),
      );
    },
  );
}
