import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../viewmodel/Address_Data_Cubit/address_data_cubit.dart';
import 'CustomAddressListView.dart';

class ShippingAddressViewBody extends StatelessWidget {
  const ShippingAddressViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressDataCubit, AddressDataState>(
      builder: (context, state) {
        if (state is GetAddressDataSuccess) {
          return CustomAddressListView(addressModel: state.addressModel);
        } else {
          return const Center(
            child: Text(''),
          );
        }
      },
    );
  }
}
