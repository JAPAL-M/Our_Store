import 'package:flutter/material.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/Styles.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width / 7,
      child: MaterialButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: kSecondaryColor,
        textColor: Colors.white,
        child: Text(
          'Add item to bag',
          style: Styles.textstyle24w400,
        ),
      ),
    );
  }
}