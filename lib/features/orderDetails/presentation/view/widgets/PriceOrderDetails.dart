import 'package:flutter/material.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/Styles.dart';
import '../../../data/models/OrderDetailsModel.dart';

class PriceOrderDetails extends StatelessWidget {
  const PriceOrderDetails({
    super.key,
    required this.orderDetailsModel,
  });

  final OrderDetailsModel orderDetailsModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cost : ${orderDetailsModel.data!.cost!.toInt()}',
                style: Styles.textstyle14
                    .copyWith(color: kSecondaryColor),
              ),
              Text(
                  'Vat : ${orderDetailsModel.data!.vat!.toInt()}',
                  style: Styles.textstyle14
                      .copyWith(color: kSecondaryColor)),
              Text(
                  'Total : ${orderDetailsModel.data!.total!.toInt()}',
                  style: Styles.textstyle14
                      .copyWith(color: kSecondaryColor)),
            ],
          ),
        ),
      ),
    );
  }
}