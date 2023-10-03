import 'package:flutter/material.dart';

import '../../../data/models/OrderDetailsModel.dart';
import 'ProductOrderDetailsListItem.dart';

class ProductOrderDetailsListView extends StatelessWidget {
  const ProductOrderDetailsListView({super.key, required this.orderDetailsModel});
  final OrderDetailsModel orderDetailsModel;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => ProductOrderDetailsListItem(products: orderDetailsModel.data!.products![index]),
        separatorBuilder: (context, index) =>
        const SizedBox(
          width: 20,
        ),
        itemCount: orderDetailsModel.data!.products!.length);
  }
}