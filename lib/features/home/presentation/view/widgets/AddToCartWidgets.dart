import 'package:flutter/material.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/Styles.dart';
import '../../../../details/presentation/view/widgets/CustomFloatingButton.dart';
import '../../../../details/presentation/view/widgets/CustomMaterialButton.dart';
import '../../../data/models/HomeModel.dart';

class AddToCartWidgets extends StatelessWidget {
  const AddToCartWidgets({
    super.key,
    required this.products,
  });

  final Products products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                '${products.price} EGP',
                style: Styles.textstyle20.copyWith(color: kSecondaryColor),
              ),
              const Spacer(),
              CustomFloatingButtons(
                onPressed: () {},
                icon: Icons.remove,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                '1',
                style: Styles.textstyle19,
              ),
              const SizedBox(
                width: 10,
              ),
              CustomFloatingButtons(
                onPressed: () {},
                icon: Icons.add,
              )
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 50,),
          CustomMaterialButton(
            textButton: 'Add item to bag',
            color: kSecondaryColor,
            styleText: Styles.textstyle20.copyWith(fontWeight: FontWeight.w400),
            radius: 8,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}