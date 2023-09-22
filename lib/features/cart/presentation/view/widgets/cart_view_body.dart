import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:our_store/features/cart/data/models/CartModel.dart';
import 'package:our_store/features/cart/presentation/viewmodel/cart_cubit.dart';
import 'CartItemListView.dart';
import 'CheckOutItem.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAndGetCartCubit, CartState>(
      builder: (context, state) {
        if (state is CartGetSuccess) {
          EasyLoading.dismiss();
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                CartItemListView(cartModel: state.cartModel,),
                CheckOutItem(cartModel: state.cartModel,)
              ],
            ),
          );
        } else if (state is CartGetFailure) {
          EasyLoading.dismiss();
          return Center(child: Text(state.errmessage));
        } else {
          EasyLoading.show(status: 'loading cart...');
          return const Text('');
        }
      },
    );
  }
}






