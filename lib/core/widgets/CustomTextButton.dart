import 'package:flutter/material.dart';

import '../utils/Styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key, required this.textbutton, required this.color, required this.onPressed,
  });
  final String textbutton;
  final Color color;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: Text(textbutton,style: Styles.textstyle12.copyWith(color: color,fontWeight: FontWeight.w600),),);
  }
}