import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constant.dart';
import '../../viewmodel/checkout_cubit.dart';

class CustomRadioListTile extends StatelessWidget {
  const CustomRadioListTile({
    super.key, required this.icon, required this.title, required this.value,
  });
  final IconData icon;
  final String title;
  final int value;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
  builder: (context, state) {
    return RadioListTile(
        selected: true,
        activeColor: kPrimaryColor,
        title: Row(
            children: [
              Icon(icon,),
              const SizedBox(width: 10,),
              Text(title)]),
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        controlAffinity: ListTileControlAffinity.trailing,
        value: value, groupValue: CheckoutCubit.get(context).payment, onChanged: (value){
      CheckoutCubit.get(context).choosePayment(value);
    });
  },
);
  }
}