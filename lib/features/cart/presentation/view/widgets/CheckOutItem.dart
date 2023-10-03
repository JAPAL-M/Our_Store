import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:our_store/features/checkout/presentation/view/checkout_view.dart';
import '../../../../../constant.dart';
import '../../../../../core/utils/Styles.dart';
import '../../../../../core/widgets/HorizntalLineSepreated.dart';
import '../../../../details/presentation/view/widgets/CustomMaterialButton.dart';
import '../../../data/models/CartModel.dart';
import '../../viewmodel/UpdateCart_Cubit/update_cart_cubit.dart';

class CheckOutItem extends StatelessWidget {
  const CheckOutItem({
    super.key,
    required this.cartModel,
  });

  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateCartCubit, UpdateCartState>(
        builder: (context, state) {
          return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Have a coupon code? enter here',
                    style: Styles.textstyle10,
                  ),
                  SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 90,
                  ),
                  TextFormField(
                      style: Styles.textstyle12,
                      readOnly: true,
                      decoration: InputDecoration(
                          hintText: 'FDDH6',
                          hintStyle: Styles.textstyle12.copyWith(
                              color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          suffixIcon: const Icon(
                            Icons.check_circle, color: Colors.greenAccent,
                          )
                      )
                  ),
                  SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 90,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Subtotal:',
                        style: Styles.textstyle12,
                      ),
                      Text(
                        '${UpdateCartCubit
                            .get(context)
                            .total} EGP',
                        style: Styles.textstyle12,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery Fee:',
                        style: Styles.textstyle12,
                      ),
                      Text(
                        '0.0',
                        style: Styles.textstyle12,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Discount:',
                        style: Styles.textstyle12,
                      ),
                      Text(
                        '0.0',
                        style: Styles.textstyle12,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 50,
                  ),
                  const HorizntalLineSepreated(),
                  SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 90,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total:',
                        style: Styles.textstyle19.copyWith(
                            color: kSecondaryColor),
                      ),
                      Text(
                        '${UpdateCartCubit
                            .get(context)
                            .total} EGP',
                        style: Styles.textstyle19.copyWith(
                            color: kSecondaryColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 90,
                  ),
                  CustomMaterialButton(
                      textButton: 'Continue to Checkout',
                      color: kSecondaryColor,
                      styleText:
                      Styles.textstyle20.copyWith(fontWeight: FontWeight.w400),
                      radius: 8,
                      onPressed: () {
                        Get.to(CheckOutView(cartModel: cartModel, totalPrice: UpdateCartCubit
                            .get(context)
                            .total,));
                      })
                ],
              )
          );
        }
    );
  }
}
