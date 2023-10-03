import 'package:flutter/material.dart';
import 'package:our_store/constant.dart';
import 'package:our_store/features/cart/data/models/CartModel.dart';
import 'package:our_store/features/checkout/presentation/view/widgets/checkout_view_body.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key, required this.cartModel, required this.totalPrice});
final CartModel cartModel;
  final int totalPrice;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CheckOut'),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: CheckOutViewBody(cartModel: cartModel, totalPrice: totalPrice,),
    );
  }
}
