import 'package:flutter/material.dart';
import 'package:our_store/constant.dart';
import 'package:our_store/features/orders/presentation/view/widgets/order_history_view_body.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order History'),centerTitle: true,backgroundColor: kPrimaryColor,leading: IconButton(onPressed: ()=> Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios_new)),),
      body: const OrderHistoryViewBody(),
    );
  }
}
