import 'package:flutter/material.dart';

import '../../../../../core/utils/Styles.dart';
import '../../../data/models/AddressModel.dart';
import '../../viewmodel/Address_Data_Cubit/address_data_cubit.dart';

class CustomAddressListItem extends StatelessWidget {
  const CustomAddressListItem({super.key, required this.dataAddress});
  final DataAddress dataAddress;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  'Name: ${dataAddress.name.toString()}',
                  style: Styles.textstyle12,
                ),
                Text(
                    'City: ${dataAddress.city.toString()}',
                    style: Styles.textstyle12),
                Text(
                    'Region: ${dataAddress.region.toString()}',
                    style: Styles.textstyle12),
                Text(
                    'Details: ${dataAddress.details.toString()}',
                    style: Styles.textstyle12),
                Text(
                    'Notes: ${dataAddress.notes.toString()}',
                    style: Styles.textstyle12),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                IconButton(
                    onPressed: () =>
                        AddressDataCubit.get(context)
                            .deleteAddress(
                            id: dataAddress
                                .id!
                                .toInt()),
                    icon: const Icon(Icons.delete)),
                SizedBox(height: MediaQuery.of(context).size.height / 15,),
                const Icon(Icons.edit),
              ],
            )
          ],
        ),
      ),
    );
  }
}