import 'package:flutter/material.dart';

import '../../../../../core/utils/AssetsData.dart';
import '../../../../../core/utils/Styles.dart';

class CustomInfoAdsWidget extends StatelessWidget {
  const CustomInfoAdsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 34.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Apple Store',
                style: Styles.textstyle20,
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 90,),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Text(
                  'Find the Apple product and accessories you’re looking for',
                  style: Styles.textstyle11,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 90,),
              Text('Shop new Year',style: Styles.textstyle11Pink,)
            ],
          ),
        ),
        Image.asset(AssetsData.lading)
      ],
    );
  }
}