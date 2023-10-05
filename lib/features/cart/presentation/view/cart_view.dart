import 'package:flutter/material.dart';
import 'package:our_store/constant.dart';
import 'package:our_store/features/cart/presentation/view/widgets/cart_view_body.dart';


class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kWhiteColor,
      body: CartViewBody(),
    );
  }
}
