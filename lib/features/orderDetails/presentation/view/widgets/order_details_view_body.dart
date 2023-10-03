import 'package:flutter/material.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/Styles.dart';
import '../../../data/models/OrderDetailsModel.dart';
import 'AddressOrderDetails.dart';
import 'PriceOrderDetails.dart';
import 'ProductOrderDetailsListView.dart';

class OrderDetailsViewBody extends StatelessWidget {
  const OrderDetailsViewBody({super.key, required this.orderDetailsModel});
  final OrderDetailsModel orderDetailsModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order Id : #${orderDetailsModel.data!.id}',
              style: Styles.textstyle14,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Products :',
                  style: Styles.textstyle14,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  child: ProductOrderDetailsListView(orderDetailsModel: orderDetailsModel,),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                Text(
                  'Address :',
                  style: Styles.textstyle14,
                ),
                AddressOrderDetails(orderDetailsModel: orderDetailsModel),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                Text(
                  'Total Price : ',
                  style: Styles.textstyle14,
                ),
                PriceOrderDetails(orderDetailsModel: orderDetailsModel),
                MaterialButton(
                  onPressed: () {},
                  color: kPrimaryColor,
                  textColor: kWhiteColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: const Text('Cancel Order'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}