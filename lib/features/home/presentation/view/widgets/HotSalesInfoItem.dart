import 'package:flutter/material.dart';

import '../../../../../core/utils/AssetsData.dart';
import '../../../../../core/utils/Styles.dart';
import 'CustomFloatingButton.dart';

class HotSalesInfoItem extends StatelessWidget {
  const HotSalesInfoItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2.5,
      child: Card(
        color: Colors.white,
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AssetsData.iphone),
              SizedBox(
                height: MediaQuery.of(context).size.height / 100,
              ),
              Text(
                'iPhone 12 Pro Max',
                style: Styles.textstyle12,
              ),
              Text(
                '512GB Unlocked',
                style: Styles.textstyle10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$2,867',
                    style: Styles.textstyle12,
                  ),
                  const CustomFloatingButton()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}