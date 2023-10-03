import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:our_store/constant.dart';
import 'package:our_store/core/animation/LoadingAnimation.dart';
import 'package:our_store/core/utils/Styles.dart';
import 'package:our_store/features/orderDetails/presentation/view/order_details_view.dart';
import 'package:our_store/features/orders/presentation/viewmodel/order_cubit.dart';

import '../../../../orderDetails/presentation/viewmodel/Order_Details_Cubit/order_details_cubit.dart';

class OrderHistoryViewBody extends StatelessWidget {
  const OrderHistoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
  builder: (context, state) {
    if (state is GetOrderSuccess) {
      return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              SizedBox(
                width: double.infinity,
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 4,
                child: Card(
                  margin: const EdgeInsets.all(20),
                  shape: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order Id : #${state.orderModel.data!.data![index].id}',
                          style: Styles.textstyle12.copyWith(color: kSecondaryColor),
                        ),
                        Text(
                          'Total Price : ${state.orderModel.data!.data![index].total!.toInt()}',
                          style: Styles.textstyle12.copyWith(color: kSecondaryColor),
                        ),
                        Text(
                          'Date : ${state.orderModel.data!.data![index].date}',
                          style: Styles.textstyle12.copyWith(color: kSecondaryColor),
                        ),
                        Text(
                          'Status : ${state.orderModel.data!.data![index].status}',
                          style: Styles.textstyle12.copyWith(color: kSecondaryColor),
                        ),
                        Align(
                            alignment: Alignment.bottomRight,
                            child: MaterialButton(
                              onPressed: () async{
                                OrderDetailsCubit.get(context).getOrderDetails(orderId: state.orderModel.data!.data![index].id!.toInt());
                                Get.to( const OrderDetailsView());
                              },
                              color: kPrimaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              textColor: kWhiteColor,
                              child: const Text('Details'),
                            ))
                      ],
                    ),
                  ),
                ),
              ), itemCount: state.orderModel.data!.data!.length);
    }else{
      return const LoadingAnimation();
    }
  },
);
  }
}
