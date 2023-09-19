import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/Styles.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    super.key, required this.textButton, required this.color, required this.styleText,required this.radius, required this.onPressed
  });
final String textButton;
final double radius;
final Color color;
final TextStyle styleText;
final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50.h,
      child: MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        color: color,
        textColor: Colors.white,
        child: Text(
          textButton,
          style: styleText,
        ),
      ),
    );
  }
}