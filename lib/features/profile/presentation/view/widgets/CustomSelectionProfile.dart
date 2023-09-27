import 'package:flutter/material.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/Styles.dart';

class CustomSelectionProfile extends StatelessWidget {
  const CustomSelectionProfile({
    super.key, required this.icon, required this.text, required this.onTap,
  });
  final IconData icon;
  final String text;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Card(
              margin: const EdgeInsets.only(right: 10),
              color: kPrimaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(icon,color: kWhiteColor,size: 20,),
              ),
            ),
            Text(text,style: Styles.textstyle17),
            const Spacer(),
            const Icon(Icons.navigate_next_outlined)
          ],
        ),
      ),
    );
  }
}