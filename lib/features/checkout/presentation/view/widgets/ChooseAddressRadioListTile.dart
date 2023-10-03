import 'package:flutter/material.dart';

import '../../../../Address/data/models/AddressModel.dart';
import '../../viewmodel/checkout_cubit.dart';

class ChooseAddressRadioListTile extends StatelessWidget {
  const ChooseAddressRadioListTile({
    super.key, required this.dataAddress, required this.index,
  });
  final DataAddress dataAddress;
  final int index;
  @override
  Widget build(BuildContext context) {
    return RadioListTile(
        title: Text(
            'City: ${dataAddress.city}'),
        subtitle: Text(
            'Details: ${dataAddress.details}'),
        value: dataAddress.id,
        groupValue: CheckoutCubit.get(context).address,
        onChanged: (value) {
          CheckoutCubit.get(context).addressSelect =
              index;
          CheckoutCubit.get(context)
              .chooseAddress(value as int?);
        });
  }
}