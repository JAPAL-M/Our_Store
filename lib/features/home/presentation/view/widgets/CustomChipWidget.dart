import 'package:flutter/material.dart';

class CustomChipWidget extends StatelessWidget {
  const CustomChipWidget({
    super.key, required this.labelString,
  });
  final String labelString;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18.0),
      child: Chip(label: Text(labelString)),
    );
  }
}