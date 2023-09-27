import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    super.key, required this.onPressed, required this.icons,
  });
final Function() onPressed;
final IconData icons;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width / 15,
        height: MediaQuery.of(context).size.width / 15,
        child: FloatingActionButton(
            heroTag: UniqueKey(),
            onPressed: onPressed,
            elevation: 5,
            backgroundColor: Colors.black,
            child: Icon(icons)));
  }
}