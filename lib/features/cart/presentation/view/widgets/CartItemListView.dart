import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_store/core/widgets/HorizntalLineSepreated.dart';
import '../../../data/models/CartModel.dart';
import '../../viewmodel/UpdateCart_Cubit/update_cart_cubit.dart';
import 'CartListInfo.dart';

class CartItemListView extends StatelessWidget {
  const CartItemListView({
    super.key, required this.cartModel,
  });
  final CartModel cartModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateCartCubit, UpdateCartState>(
  builder: (context, state) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.4,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => CartListInfo(
          product: cartModel.data!.cartItems![index].product,
          cartItems: cartModel.data!.cartItems![index], cartModel: cartModel,
        ),
        separatorBuilder: (context, index) =>  const HorizntalLineSepreated(),
        itemCount: cartModel.data!.cartItems!.length,
      ),
    );
  },
);
  }
}