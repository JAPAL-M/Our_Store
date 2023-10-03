import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../cart/presentation/view/widgets/CartInfoProduct.dart';
import '../../../../home/data/models/HomeModel.dart';

class CheckOutCartListItem extends StatelessWidget {
  const CheckOutCartListItem({super.key, required this.products});
  final Products products;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CachedNetworkImage(
          imageUrl: products.images![1]
              .toString(),
          height: MediaQuery.of(context).size.width / 4,
          width: MediaQuery.of(context).size.width / 4,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 20,
        ),
        CartInfoProduct(
            product: products),
      ],
    );
  }
}