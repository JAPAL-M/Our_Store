import 'package:flutter/material.dart';
import 'package:our_store/features/home/data/models/HomeModel.dart';

import '../../../../../core/utils/Styles.dart';

class CartInfoProduct extends StatelessWidget {
  const CartInfoProduct({super.key, required this.product});
  final Products product;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.name.toString(),
            style: Styles.textstyle12,
            maxLines: 1,
          ),
          Text(
            'Subtitle',
            style: Styles.textstyle10,),
          SizedBox(height: MediaQuery.of(context).size.height / 100,),
          Text('${product.price} EGP',style: Styles.textstyle12,),
        ],
      ),
    );
  }
}