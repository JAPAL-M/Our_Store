import 'package:flutter/material.dart';
import 'package:our_store/constant.dart';
import 'package:our_store/features/checkout/presentation/view/widgets/checkout_view_body.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CheckOut'),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: const CheckOutViewBody(),
    );
  }
}
