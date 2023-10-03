import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/utils/AssetsData.dart';
import '../../viewmodel/Address_Data_Cubit/address_data_cubit.dart';
import 'CustomAddressListView.dart';

class ShippingAddressViewBody extends StatelessWidget {
  const ShippingAddressViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressDataCubit, AddressDataState>(
      builder: (context, state) {
        if (state is GetAddressDataSuccess) {
          if(state.addressModel.data!.data!.isEmpty){
            return Center(child: Lottie.asset(AssetsData.empty,height: MediaQuery.of(context).size.height / 2,repeat: false));
          }else {
            return CustomAddressListView(addressModel: state.addressModel);
          }
        } else if(state is AddAddressDataFailure){
          return Center(
            child: Text(state.errmessage),
          );
        }else{
          return Center(child: Lottie.asset(AssetsData.loadingAnimation,height: MediaQuery.of(context).size.height / 4));
        }
      },
    );
  }
}
