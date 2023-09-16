import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width / 15,
        height: MediaQuery.of(context).size.width / 15,
        child: FloatingActionButton(
            onPressed: () {},
            elevation: 5,
            backgroundColor: Colors.black,
            child: const Icon(Icons.add)));
  }
}