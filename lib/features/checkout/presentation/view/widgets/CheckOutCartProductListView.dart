import 'package:flutter/material.dart';

import '../../../../../core/widgets/HorizntalLineSepreated.dart';
import '../../../../cart/data/models/CartModel.dart';
import 'CheckOutCartListItem.dart';

class CheckOutCartProductListView extends StatelessWidget {
  const CheckOutCartProductListView({
    super.key, required this.cartModel,
  });
  final CartModel cartModel;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => CheckOutCartListItem(products: cartModel.data!.cartItems![index].product!),
      separatorBuilder: (context, index) =>
      const HorizntalLineSepreated(),
      itemCount: cartModel.data!.cartItems!.length,
    );
  }
}