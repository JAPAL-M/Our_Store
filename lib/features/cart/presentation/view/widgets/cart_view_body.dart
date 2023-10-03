import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lottie/lottie.dart';
import 'package:our_store/features/cart/data/models/CartModel.dart';
import 'package:our_store/features/cart/presentation/viewmodel/AddAndGetCart_Cubit/cart_cubit.dart';
import '../../../../../core/animation/EmptyProductAnimation.dart';
import '../../../../../core/animation/LoadingAnimation.dart';
import '../../../../../core/utils/AssetsData.dart';
import 'CartItemListView.dart';
import 'CheckOutItem.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAndGetCartCubit, AddAndGetCartState>(
      builder: (context, state) {
        if (state is CartGetSuccess) {
          if(state.cartModel.data!.cartItems!.isEmpty){
            return const EmptyProductAnimation();
          }else{
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  CartItemListView(cartModel: state.cartModel,),
                  CheckOutItem(cartModel: state.cartModel,)
                ],
              ),
            );
          }
        } else if (state is CartGetFailure) {
          return Center(child: Text(state.errmessage));
        } else {
          return const LoadingAnimation();
        }
      },
    );
  }
}










