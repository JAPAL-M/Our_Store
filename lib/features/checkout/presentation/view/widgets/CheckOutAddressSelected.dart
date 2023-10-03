import 'package:flutter/material.dart';

import '../../../../../core/utils/Styles.dart';
import '../../../../Address/data/models/AddressModel.dart';
import '../../viewmodel/checkout_cubit.dart';

class CheckOutAddressSelected extends StatelessWidget {
  const CheckOutAddressSelected({
    super.key, required this.addressModel,
  });
  final AddressModel addressModel;
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name: ${addressModel.data!.data![CheckoutCubit.get(context).addressSelect!].name.toString()}',
                  style: Styles.textstyle12,
                ),
                Text(
                    'City: ${addressModel.data!.data![CheckoutCubit.get(context).addressSelect!].city.toString()}',
                    style: Styles.textstyle12),
                Text(
                    'Region: ${addressModel.data!.data![CheckoutCubit.get(context).addressSelect!].region.toString()}',
                    style: Styles.textstyle12),
                Text(
                    'Details: ${addressModel.data!.data![CheckoutCubit.get(context).addressSelect!].details.toString()}',
                    style: Styles.textstyle12),
                Text(
                    'Notes: ${addressModel.data!.data![CheckoutCubit.get(context).addressSelect!].notes.toString()}',
                    style: Styles.textstyle12),
              ],
            ),
          ],
        ),
      ),
    );
  }
}