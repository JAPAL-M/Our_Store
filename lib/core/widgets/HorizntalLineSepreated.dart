import 'package:flutter/material.dart';

class HorizntalLineSepreated extends StatelessWidget {
  const HorizntalLineSepreated({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      width: double.infinity,
      height: 1,
      color: Colors.grey,
    );
  }
}