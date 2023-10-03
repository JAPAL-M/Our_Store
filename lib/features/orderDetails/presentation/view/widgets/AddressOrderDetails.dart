import 'package:flutter/material.dart';

import '../../../../../core/utils/Styles.dart';
import '../../../data/models/OrderDetailsModel.dart';

class AddressOrderDetails extends StatelessWidget {
  const AddressOrderDetails({super.key, required this.orderDetailsModel});
  final OrderDetailsModel orderDetailsModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name: ${orderDetailsModel.data!.address!.name.toString()}',
                  style: Styles.textstyle12,
                ),
                Text(
                    'City: ${orderDetailsModel.data!.address!.city.toString()}',
                    style: Styles.textstyle12),
                Text(
                    'Region: ${orderDetailsModel.data!.address!.region.toString()}',
                    style: Styles.textstyle12),
                Text(
                    'Details: ${orderDetailsModel.data!.address!.details.toString()}',
                    style: Styles.textstyle12),
                Text(
                    'Notes: ${orderDetailsModel.data!.address!.notes.toString()}',
                    style: Styles.textstyle12),
              ],
            ),
          ],
        ),
      ),
    );
  }
}