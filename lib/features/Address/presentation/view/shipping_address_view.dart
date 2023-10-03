import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_store/constant.dart';
import 'package:our_store/core/utils/Styles.dart';
import 'package:our_store/core/widgets/CustomTextFormField.dart';
import 'package:our_store/features/Address/data/models/AddressModel.dart';
import 'package:our_store/features/Address/presentation/view/widgets/CustomAddressListView.dart';
import 'package:our_store/features/Address/presentation/view/function/CustomBottomSheet.dart';
import 'package:our_store/features/Address/presentation/view/widgets/shipping_address_view_body.dart';
import 'package:our_store/features/Address/presentation/viewmodel/Address_Data_Cubit/address_data_cubit.dart';
import 'package:our_store/features/home/presentation/view/widgets/CustomFloatingButton.dart';
import 'package:our_store/features/profile/presentation/viewmodel/profile_cubit.dart';

import '../viewmodel/Address_View_Cubit/address_cubit.dart';

class ShippingAddressView extends StatelessWidget {
  ShippingAddressView({super.key});

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Your Address'),
            centerTitle: true,
            backgroundColor: kPrimaryColor,
            leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios_new)),
          ),
          key: scaffoldKey,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              CustomBottomSheet(context,scaffoldKey);
            },
            backgroundColor: kPrimaryColor,
            child: Icon(AddressCubit.get(context).fabIcon),
          ),
          body: const ShippingAddressViewBody(),
        );
      },
    );
  }


}



