import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:our_store/features/cart/data/models/CartModel.dart';
import 'package:our_store/features/details/presentation/view/details_view.dart';
import 'package:our_store/features/home/data/models/HomeModel.dart';
import '../../viewmodel/UpdateCart_Cubit/update_cart_cubit.dart';
import 'AddOrRemoveItemCart.dart';
import 'CartInfoProduct.dart';
class CartListInfo extends StatelessWidget {
  const CartListInfo({
    super.key, required this.product, required this.cartItems, required this.cartModel,
  });
  final Products? product;
  final CartItems cartItems;
  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
        return BlocBuilder<UpdateCartCubit, UpdateCartState>(
  builder: (context, state) {
    return GestureDetector(
          onTap: (){
            Get.to(DetailsView(products: product!));
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: product!.images![1]
                      .toString(),
                  height: MediaQuery.of(context).size.width / 4,
                  width: MediaQuery.of(context).size.width / 4,
                ),
                SizedBox(width: MediaQuery.of(context).size.width / 20,),
                CartInfoProduct(product: product!),
                AddOrRemoveItemCart(cartItems: cartItems, cartModel: cartModel,),
              ],
            ),
          ),
        );
  },
);
  }
}





