import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_store/constant.dart';
import 'package:our_store/features/Address/presentation/view/function/CustomBottomSheet.dart';
import 'package:our_store/features/Address/presentation/view/widgets/shipping_address_view_body.dart';

import '../viewmodel/Address_View_Cubit/address_cubit.dart';

class ShippingAddressView extends StatelessWidget {
  const ShippingAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
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
              CustomBottomSheet(context, scaffoldKey);
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
