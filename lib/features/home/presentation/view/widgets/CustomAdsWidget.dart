import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'CustomInfoAdsWidget.dart';

class CustomAdsWidget extends StatelessWidget {
  const CustomAdsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      margin: const EdgeInsets.only(top: 31, bottom: 21),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 5,
      decoration: BoxDecoration(
          color: HexColor('#843667'),
          borderRadius: BorderRadius.circular(8)),
      child: const CustomInfoAdsWidget(),
    );
  }
}