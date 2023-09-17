import 'package:flutter/material.dart';

class CustomFloatingButtons extends StatelessWidget {
  const CustomFloatingButtons({
    super.key, required this.onPressed, required this.icon,
  });
  final Function() onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width / 20,
        height: MediaQuery.of(context).size.width / 20,
        child: FloatingActionButton(
          onPressed: onPressed,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50)),
          backgroundColor: Colors.white,
          child: Icon(
            icon,
            color: Colors.black,
            size: 15,
          ),
        ));
  }
}