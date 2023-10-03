import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_store/core/animation/LoadingAnimation.dart';
import 'package:our_store/features/orderDetails/presentation/view/widgets/order_details_view_body.dart';
import '../../../../constant.dart';
import '../viewmodel/Order_Details_Cubit/order_details_cubit.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
      builder: (context, state) {
        if (state is GetOrderDetailsSuccess) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Order Details'),
              centerTitle: true,
              backgroundColor: kPrimaryColor,
              leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios_new)),
            ),
            body: OrderDetailsViewBody(orderDetailsModel: state.orderDetailsModel)
          );
        } else {
          return const LoadingAnimation();
        }
      },
    );
  }
}










