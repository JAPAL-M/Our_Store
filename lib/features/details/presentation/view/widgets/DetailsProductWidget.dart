import 'package:flutter/material.dart';
import 'package:our_store/constant.dart';
import 'package:our_store/features/home/data/models/HomeModel.dart';
import '../../../../../core/utils/Styles.dart';
import '../../../../cart/presentation/view/widgets/CustomFloatingButton.dart';
import 'CustomMaterialButton.dart';
import 'CustomRaitingProduct.dart';

class DetailsProductWidget extends StatelessWidget {
  const DetailsProductWidget({
    super.key,
    required this.products,
  });

  final Products products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            products.name.toString(),
            style: Styles.textstyle20.copyWith(color: kSecondaryColor),
            maxLines: 1,
          ),
          const CustomRaitingProduct(),
          SizedBox(
            height: MediaQuery.of(context).size.height / 50,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            child: Text(
              products.description.toString(),
              style: Styles.textstyle11.copyWith(fontWeight: FontWeight.w300,color: Colors.black),
              overflow: TextOverflow.fade,
            ),
          ),
        ],
      ),
    );
  }
}
