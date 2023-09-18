import 'package:flutter/material.dart';

import '../../constant.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key, required this.labeltext, required this.prefixIcon,required this.obscureText, required this.keyboardType, required this.controller
  });
  final String labeltext;
  final IconData prefixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      color: Colors.grey,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor)
            ),
            floatingLabelStyle: TextStyle(color: kPrimaryColor),
            prefixIconColor: kPrimaryColor,
            prefixIcon: Icon(prefixIcon),
            label: Text(labeltext)
        ),
      ),
    );
  }
}