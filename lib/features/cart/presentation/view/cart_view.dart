import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_store/constant.dart';
import 'package:our_store/features/cart/presentation/view/widgets/CartListInfo.dart';
import 'package:our_store/features/cart/presentation/view/widgets/cart_view_body.dart';
import 'package:our_store/features/cart/presentation/viewmodel/cart_cubit.dart';
import 'package:our_store/features/home/presentation/view/widgets/HotSalesListView.dart';

import '../../../home/presentation/view/widgets/HotSalesInfoItem.dart';

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
