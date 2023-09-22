import 'package:flutter/material.dart';

import '../../../../../core/utils/Styles.dart';
import '../../../../details/presentation/view/widgets/CustomFloatingButton.dart';
import '../../../../details/presentation/viewmodel/AddToCart/update_cart_cubit.dart';
import '../../../data/models/CartModel.dart';

class AddOrRemoveItemCart extends StatelessWidget {
  const AddOrRemoveItemCart({super.key, required this.cartItems, required this.cartModel});
  final CartItems cartItems;
  final CartModel cartModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomFloatingButtons(onPressed: (){
          UpdateCartCubit.get(context).remove(context,cartItems,cartModel);
        }, icon: Icons.remove),
        SizedBox(width: MediaQuery.of(context).size.width / 40,),
        Text(cartItems.quantity.toString(),style: Styles.textstyle14,),
        SizedBox(width: MediaQuery.of(context).size.width / 40,),
        CustomFloatingButtons(onPressed: (){
          UpdateCartCubit.get(context).add(context,cartItems,cartModel);
        }, icon: Icons.add),
      ],
    );
  }
}