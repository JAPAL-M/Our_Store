import 'package:flutter/material.dart';

import '../../../data/models/AddressModel.dart';
import 'CustomAddressListItem.dart';

class CustomAddressListView extends StatelessWidget {
  const CustomAddressListView({super.key, required this.addressModel});
  final AddressModel addressModel;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => CustomAddressListItem(dataAddress: addressModel.data!.data![index]),
        separatorBuilder: (context, index) => SizedBox(
          height: MediaQuery.of(context).size.height / 90,
        ),
        itemCount: addressModel.data!.data!.length);
  }
}

